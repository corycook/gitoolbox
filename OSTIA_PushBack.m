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
% This method can be thought of a symmetrical operation as Onward_PTT. It
% pushes a portion of outputs forward to make up identical states so that
% they are able to merge.
% Input: TRANSDUCER T, two states q, p, alphabet index a
% Output: T -> New transducer setting u as the common outputs for both q and p
%         flag -> Indicator if push back is succeed
%         u The longest common prefix of outputs for q and p
%         u1 New output for q cutted u from head
%         u2 New output for p cutted u from head

function [T, flag] = OSTIA_PushBack(T, q, p, a)
%OT Summary of this function goes here
%   Detailed explanation goes here
    string_set = {};
    flag = 1;
    if T.StateTransition(q, a)
        string_set{length(string_set) + 1, 1} = T.OutputTransduction{q, a};
    else
        % No transition for this, return false
        flag = 0;
        return;
    end
    if T.StateTransition(p, a)
        string_set{length(string_set) + 1, 1} = T.OutputTransduction{p, a};
    else
        % No transition for this, return false
        flag = 0;
        return;
    end
    u = LongestCommonPrefix(string_set);
    if (u == 0)
        % No common prefix for these two states, return false
        flag = 0;
        return;
    else
        u1 = T.OutputTransduction{q, a};
        u2 = T.OutputTransduction{p, a};
        % cut the common prefix off from outputs
        if strcmp(u1, u)
            u1 = '';
        else
            u1 = u1((length(u)+1):length(u1));
        end
        if strcmp(u2, u)
            u2 = '';
        else
            u2 = u2((length(u)+1):length(u2));
        end
        % so the outputs now are common for these two states
        T.OutputTransduction{q, a} = u;
        T.OutputTransduction{p, a} = u;
    end
    for b = 1:length(T.InAlphabets)
        % for successors of these two states, add cutted prefixes to the outputs
        qnext = T.StateTransition(q, b);
        pnext = T.StateTransition(p, b);
        if qnext
            T.OutputTransduction{qnext, b} = strcat(u1, T.OutputTransduction{qnext, b});
        end
        if pnext
            T.OutputTransduction{pnext, b} = strcat(u2, T.OutputTransduction{pnext, b});
        end
    end
    % Also add cutted prefixes to the states' outputs
    qnext = T.StateTransition(q, a);
    pnext = T.StateTransition(p, a);
    if strcmp(T.StateOutputs{qnext}, '*')
        T.StateOutputs{qnext} = u1;
    else
        T.StateOutputs{qnext} = strcat(u1, T.StateOutputs{qnext});
    end
    if strcmp(T.StateOutputs{pnext}, '*')
        T.StateOutputs{pnext} = u2;
    else
        T.StateOutputs{pnext} = strcat(u2, T.StateOutputs{pnext});
    end
    flag = 1;
end

