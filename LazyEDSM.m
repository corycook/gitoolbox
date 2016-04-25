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
% ------------------
% The lasy-EDSM algorithm
% to-be added

function dfa = LazyEDSM(sample, depth)
%LASYEDSM Summary of this function goes here
%   Detailed explanation goes here
    [training, group, positive, negative] = ReadSamples(sample);
    dfa = BUILD_PTA(positive);
    % adding the red states
    dfa.RED = [dfa.RED, dfa.FiniteSetOfStates(1)];
    
    % adding the blue states
    for i = 1:length(dfa.Alphabets)
        temp_blue = GetTransitionState(dfa, dfa.FiniteSetOfStates(1), dfa.Alphabets(i));
        if(temp_blue~=0) % 0 means no transition            
            dfa.BLUE = [dfa.BLUE, temp_blue];
        end
    end
    
    % start running main loop..
    display('Running LazyEDSM on PTA....');
    while ~isempty(dfa.BLUE)
        % get out of the loop when there is no blue state
        d = 1;
        atleastonemerge = false;
        bs = -inf;
        dfa2 = dfa;
        for i = 1:length(dfa2.RED)
            qr = dfa2.RED(i);     % red state
            while ((d <= depth) && (~isempty(dfa2.BLUE)))
                % when it does not reach the depth yet and BLUE set is not
                % empty.
                dfa2.BLUE = sort(dfa2.BLUE);
                qb = dfa2.BLUE(1);    % blue state
                dfa2.BLUE = dfa2.BLUE(2:length(dfa2.BLUE));
                dfa2 = EDSM_MERGE(dfa2, qr, qb);
                dfa2 = AddNewBlueStates(dfa2);
                d = d + 1;
            end
            s = EDSM_Count(dfa2, positive, negative);
            if (s > -inf)
                atleastonemerge = true;
            end
            if (s > bs)
                bs = s;
                dfa_best = dfa2;
            end
            d = 1;
            dfa2 = dfa;
        end
        if ~atleastonemerge
            dfa.BLUE = sort(dfa.BLUE);
            qpromote = dfa.BLUE(1);
            dfa.BLUE(1) = [];
            dfa = EDSM_PROMOTE(qpromote, dfa);
            display('promoting:');
            display(qpromote);
        else
            dfa = dfa_best;
            display('merged accepted..');
            dfa
        end       
    end
end

