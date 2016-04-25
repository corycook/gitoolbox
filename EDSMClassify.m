
function class = EDSMClassify(sample, training, group)
    % sort of positive and negetive sample from the training dataset
    positive = [];
    negative = [];
    for i = 1:length(training)
        if(group(i)==1)
            positive = [positive; training(i)];
        else
            negative = [negative; training(i)];
        end
    end
    
    % get the DFA from the training data
    dfa = EDSM(positive, negative);
    class = [];
    for i = 1:length(sample)
        str = char(strrep(sample(i), ' ', ''));
        class = [class; IsStringAccepted(str, dfa)];        
    end        
end