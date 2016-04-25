function [ dffa, training_set_sorted, numSamples ] = Build_FPTA( filename )
%BUILDFPTA Creates a Prefix Tree Acceptor for the given input file
%   Detailed explanation goes here
    alphabet = {};
    training_set = {};
    HANDLE = fopen(filename, 'r');
    if (HANDLE < 0)
        error('Could not open file')
    end
    
    line = fgetl(HANDLE);
    while (ischar(line))
        training_set{length(training_set) + 1} = line;
        chars = unique(line);
        for i = 1:length(chars)
            if (isempty(alphabet))
                alphabet{1} = chars(i);
            elseif (~any(strcmp(alphabet, chars(i))))
                alphabet{length(alphabet) + 1} = chars(i);
            end
        end
        line = fgetl(HANDLE);
    end
    fclose(HANDLE);
    
    training_set_sorted = sort(training_set);
    numSamples = length(training_set_sorted);
    
    initial = numSamples;
    final = 0;
    stateCount = 1;
    transition = [];
    frequency = [];
    alphabetCount = length(alphabet);
    
    HANDLE = waitbar(0, 'Building Frequency Prefix Tree Acceptor');
    
    % begin building prefix tree acceptor
    prefixes = {''};
    for i = 1:length(training_set_sorted)
        waitbar(i / length(training_set_sorted));
        
        str = training_set_sorted{i};
        
        % find largest existing prefix in str
        low = 1;
        high = length(str);
        pt = floor((low + high) / 2);
        while low < high
            if any(strncmp(str, prefixes, pt))
                low = pt + 1;
            else
                high = pt - 1;
            end
            pt = floor((low + high) / 2);
        end
        
        if pt > 0 && ~any(strncmp(str, prefixes, pt))
            pt = pt - 1;
        end
        
        count = length(str) - pt; % # of new states
        if count
            stateCount = length(prefixes) + count;
            final(length(final)+1:stateCount, 1) = 0;
            transition(length(transition)+1:stateCount, 1:alphabetCount) = 0;
            frequency(length(frequency)+1:stateCount, 1:alphabetCount) = 0;
        end
        
        % increment frequency for old states
        transit_state_from = 1;
        for j = 1:pt
            alphabet_index = strcmp(alphabet, str(j));
            frequency(transit_state_from, alphabet_index) = frequency(transit_state_from, alphabet_index) + 1;
            transit_state_from = transition(transit_state_from, alphabet_index);
        end
        
        % add new states
        for j = pt+1:length(str)
            new_state = length(prefixes) + 1;
            prefixes{new_state} = str(1:j);
            alphabet_index = strcmp(alphabet, str(j));
            transition(transit_state_from, alphabet_index) = new_state;
            frequency(transit_state_from, alphabet_index) = frequency(transit_state_from, alphabet_index) + 1;
            transit_state_from = new_state;
        end
        
        final(transit_state_from) = final(transit_state_from) + 1;
    end
    initial(2:stateCount, 1) = 0;
    dffa = DFFA((1:stateCount)', alphabet, initial, final, { transition, frequency }, transition, [], []);
    
    close(HANDLE)
end
