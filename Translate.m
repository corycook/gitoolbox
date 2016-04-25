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
% This method is used to translate a string to another string by means of
% a Transducer.
% Input: TRANSDUCER T, string w
% Output: translated string f or false when translating fails.

function output = Translate(T, w)
%TRANSLATE Summary of this function goes here
%   Detailed explanation goes here
    output = '';
    q = 1;
    for i = 1:length(w)
        a = find(strcmp(T.InAlphabets, w(i)));
        if isempty(a)
            output = 0;
            return;
        else
            if T.StateTransition(q, a) ~= 0
                output = strcat(output, T.OutputTransduction{q, a});
                q = T.StateTransition(q, a);
            else
                output = 0;
                return;
            end
        end
    end
    if strcmp(T.StateOutputs{q}, '*')
        output = 0;
    else
        output = strcat(output, T.StateOutputs{q});
    end

end

