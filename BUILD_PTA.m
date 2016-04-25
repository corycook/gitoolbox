% Author: Hasan Ibne Akram, Huang Xiao
% Munich University of Technology
% Web: http://www.sec.in.tum.de/hasan-akram/
% Email: hasan.akram@sec.in.tum.de
%          huang.xiao@mytum.de
% Copyright © 2010
% 
% This is a beta version
% 
% DISCLAIMER OF WARRANTY
% This source code is provided "as is" and without warranties
% as to performance or merchantability. The author and/or 
% distributors of this source code may have made statements 
% about this source code. Any such statements do not constitute 
% warranties and shall not be relied on by the user in deciding
% whether to use this source code.
% 
% This source code is provided without any express or implied
% warranties whatsoever. Because of the diversity of conditions
% and hardware under which this source code may be used, no
% warranty of fitness for a particular purpose is offered. The 
% user is advised to test the source code thoroughly before relying
% on it. The user must assume the entire risk of using the source code.
% 
% -----------------
% Building PTA according to positive samples
% Order positive samples lexically and create a list of all possible
% alphabets. 
% Create prefix strings of all positive samples without any duplication.
% Add states coresponding to prefixes and add transitions to transition
% matrix.

function PTA = BUILD_PTA(training)
    % sort data in lexical order
    training = LEXSORT(training);
    training_len = length(training);
    SetOfStates = [1];
    transition_matrix = [];
    Initial_States = [1];
    Final_Rejecting_States = [];
    Final_Accepting_States = [];
    
    % A is the set of alphabets
    A = {};
    
    % creating the alphabet list
    
    for i=1:training_len
    str = char(training(i));
        for j = 1: length(str)
             % cheking if alphabet already entered into the list
             if(isempty(A))
                A{1} = str(j); 
             end
             check = max(strcmp(A, str(j)));
             % adding the alphabets
             if(check == 0)
                 A{length(A) + 1} = str(j);                  
             end
             
        end
    end
    prefixes = {''};
    max_str_len = 1; 
    j = 1;  
    
    while (j<=max_str_len)
        for i = 1:training_len
            str = training{i};
            % inserting the max length of the string
            str_len = length(str);
            if(str_len>max_str_len)
                max_str_len = str_len;
            end
            if(j<=str_len)
                prefix_len = length(prefixes);
                prefix_str = str(1:j);
                if(strcmp(prefixes{prefix_len}, prefix_str)==0)
                    prefixes{prefix_len+1} = prefix_str;
                    % add states corresponding to the prefix
                    SetOfStates = [SetOfStates, (length(SetOfStates) +1)];
                    % initializing a new row in the transition matrix as
                    % zero
                    transition_matrix(length(SetOfStates),:) = 0;    
                    % adding the transitions
                    transition_source_state = find(strcmp(prefixes, prefix_str(1:j-1)));
                    transition_state = SetOfStates(length(SetOfStates));
                    alphabet_index = find(strcmp(A, prefix_str(j:j)));                    
                    transition_matrix(transition_source_state, alphabet_index) = transition_state;       
                    % adding final state
                    if(str_len==length(prefix_str))
                        Final_Accepting_States = [Final_Accepting_States, length(SetOfStates)];
                    end
                end       
            end
        end
        j = j + 1;
    end
    PTA = DFA(SetOfStates, A, transition_matrix, Initial_States, Final_Accepting_States, Final_Rejecting_States, [], []);    
end