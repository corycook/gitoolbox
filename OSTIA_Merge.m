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
% Merge function for OSTIA.
% This method will merge two states
% input: the Transducer T, state q1 and q2 to be merged, q1 is a member of RED and q2
% is a member of BLUE
% output: the updated Transducer T
% 
% First of all, we find out the precedessor(q_f) of BLUE state(q2),
% And then set the state transition (q_f, a) as the RED state(q1).
% After operations above, a tree rooted at q2 will be isolated from T.
% Then we call OSTIA_FOLD to concatenate this tree onto current T.
% OSTIA_MERGE returns an updated Transducer.
% see also OSTIA_FOLD

function T = OSTIA_Merge(T, qr, qb)
%OSTIA_MERGE Summary of this function goes here
%   Detailed explanation goes here
    alpha = 0;
    for i = 1:length(T.InAlphabets)
        % find predecessor of blue state qb
        col = T.StateTransition(:, i);
        qf = find(col == qb);
        if length(qf) > 1
            qf = qf(1);
        end
        if qf ~= 0
            alpha = i;
            break;
        end
    end
    T.StateTransition(qf, alpha) = qr;
    T = OSTIA_Fold(T, qr, qb);
end

