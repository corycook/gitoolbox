function lazyedsm_cv(samplefile, resultfile, depth, folder)
%LAZYEDSM_CV Summary of this function goes here
%   Detailed explanation goes here
    [train, group, positive, negative] = ReadSamples(samplefile);
    fout = fopen(resultfile, 'w');
    tp = 0;
    fp = 0;
    tn = 0;
    fn = 0;
    p_accept = 0;
    n_accept = 0;
    p_reject = 0;
    n_reject = 0;
    pos_len = length(positive);
    neg_len = length(negative);
    j = 0;
    round = 1;
    pos_start = 1;
    neg_start = 1;
    posfoldcount = uint16(pos_len/folder);
    negfoldcount = uint16(neg_len/folder);
    fprintf(fout, 'Lazy-EDSM Validation Results:\n');
    fprintf(fout, 'positive samples: %d | negative samples: %d \n', pos_len, neg_len);
    while (round <= folder)
        pos_last = pos_start + posfoldcount - 1;
        neg_last = neg_start + negfoldcount - 1;
        if pos_last > pos_len
            pos_last = pos_len;
        end
        if neg_last > neg_len
            neg_last = neg_len;
        end
        test_positive_set = positive(pos_start:pos_last);
        train_positive_set = positive;
        train_positive_set(pos_start:pos_last) = [];
        test_negative_set = negative(neg_start:neg_last);
        train_negative_set = negative;
        train_negative_set(neg_start:neg_last) = [];
        %dfa = LazyEDSM(train_positive_set, train_negative_set, depth);
        dfa = RPNI(train_positive_set, train_negative_set);
        for k = 1:length(test_positive_set)
            str = test_positive_set{k};
            if IsStringAccepted(str, dfa)
                p_accept = p_accept + 1;
            else
                p_reject = p_reject + 1;
            end
        end
        for k = 1:length(test_negative_set)
            str = test_negative_set{k};
            if IsStringAccepted(str, dfa)
                n_accept = n_accept + 1;
            else
                n_reject = n_reject + 1;
            end
        end
        % output
        fprintf(fout, 'Round %d: \n', round);
        fprintf(fout, 'True Positive: %5.2f \n', p_accept/length(test_positive_set));
        tp = tp + p_accept/length(test_positive_set);
        fprintf(fout, 'False Positive: %5.2f \n', n_accept/length(test_negative_set));
        fp = fp + n_accept/length(test_negative_set);
        fprintf(fout, 'True Negative: %5.2f \n', n_reject/length(test_negative_set));
        tn = tn + n_reject/length(test_negative_set);
        fprintf(fout, 'False Negative: %5.2f \n', p_reject/length(test_positive_set));
        fn = fn + p_reject/length(test_positive_set);
        pos_start = pos_last + 1;
        neg_start = neg_last + 1;
        round = round + 1;
        p_accept = 0;
        n_accept = 0;
        p_reject = 0;
        n_reject = 0;
    end
    tp = tp/folder;
    fp = fp/folder;
    tn = tn/folder;
    fn = fn/folder;
    fprintf(fout, 'Averaged:\n');
    fprintf(fout, 'True Positive: %5.2f\n', tp);
    fprintf(fout, 'False Positive: %5.2f\n', fp);
    fprintf(fout, 'True Negative: %5.2f\n', tn);
    fprintf(fout, 'False Negative: %5.2f\n', fn);
end

