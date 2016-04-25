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
% -------------------------------------------------
% This function reads samples from file and return a DFA by k-testable
% language;
% Input: filename, The path of sample file;
%        k, the learning parameter k;
% Output: Return a DFA

function dfa = K2dfa(filename, k)
    % First of all, build K language from samples
    kset = KBuilder(filename, k);
    SetOfStates = [];
    Alphabets = kset.Alphabets;
    TransitionMatrix = [];
    InitialState = [1];
    FinalAcceptStates = [];
    FinalRejectStates = [];
    RED = [];
    BLUE = [];
    
    I = kset.ISET;
    C = kset.CSET;
    F = kset.FSET;
    T = kset.TSET;
    
    % set initial state as a null string%
    SetOfStates{1,1} = '';
    
    % combine set I and C together %
    IandC = I;
    for i = 1:length(C)
        if isequal(ismember([C(1, i)], I), [1]) == 0
            IandC{1,length(IandC)+1} = C(1, i);
        end
    end
    
    % find all prefixes in set I and C and push them into SetOfStates of DFA %
    for i = 1:length(IandC)
        str = IandC{1, i, 1};
        for len = 1:length(str)
            if isequal(ismember([str(1:len)], SetOfStates), [1]) == 0
                SetOfStates{1,length(SetOfStates)+1} = str(1:len);
            end
        end
    end
    
    % push (k-1) prefixes and (k-1) suffixes from strings in T to SetOfStates of DFA %
    for i = 1:length(T)
        str = T{1, i, 1};
        if length(str) > 1
            t_suff = str(2:length(str));
            t_pref = str(1:(length(str) - 1));
            if isequal(ismember([t_suff], SetOfStates), [1]) == 0
                SetOfStates{1, length(SetOfStates)+1} = t_suff;
            end
            if isequal(ismember([t_pref], SetOfStates), [1]) == 0
                SetOfStates{1, length(SetOfStates)+1} = t_preff;
            end
        else break;
        end 
    end
    
    % initialze transition matrix %
    for i = 1:length(SetOfStates)
        for j = 1:length(Alphabets)
            TransitionMatrix(i, j) = 0;
        end
    end
    
    % set transition matrix %
    % find out transition rules according to set I and C %
    for i = 1:length(IandC)
        str = IandC{1, i, 1};
        if strcmp(str, '') == 1
            continue;
        end
        for index = 1:length(str)
            if index == 1
                src_str = '';
            else
                src_str = str(1:(index-1));
            end
            dst_str = str(1:index);
            transit_label_index = find(ismember(Alphabets, [str(index)]));
            transit_src_index = find(ismember(SetOfStates, [src_str]));
            transit_dst_index = find(ismember(SetOfStates, [dst_str]));
            TransitionMatrix(transit_src_index, transit_label_index) = transit_dst_index;
        end
    end
    
    % find out transition rules according to set T %    
    for i = 1:length(T)
        str = T{1, i, 1};
        if length(str) < 2
            continue;
        end
        src_str = str(1:(length(str)-1));
        dst_str = str(2:length(str));
        transit_label_index = find(ismember(Alphabets, [str(length(str))]));
        transit_src_index = find(ismember(SetOfStates, [src_str]));
        transit_dst_index = find(ismember(SetOfStates, [dst_str]));
        TransitionMatrix(transit_src_index, transit_label_index) = transit_dst_index;
    end
    
    % push sets F and C to FinalAcceptStates%
    for i = 1:length(F)
        str = F{1, i, 1};
        index = find(ismember(SetOfStates, [str]));
        FinalAcceptStates(1, length(FinalAcceptStates)+1) = index;
    end
          
    for i = 1:length(C)
        str = C{1, i, 1};
        index = find(ismember(SetOfStates, [str]));
        if isequal(ismember(index, FinalAcceptStates), [1]) == 0
           FinalAcceptStates(1, length(FinalAcceptStates)+1) = index;
        end
    end
    
    % set finite set of state
    for i = 1:length(SetOfStates)
        FiniteSetOfStates(1, i) = i;
    end
    
    % return DFA %
    dfa = DFA(FiniteSetOfStates, Alphabets, TransitionMatrix, InitialState, FinalAcceptStates, FinalRejectStates, RED, BLUE);

end
