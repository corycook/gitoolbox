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
% Find out the longest common prefix string in a set of strings
% Specially hard coded for algorithm OSTIA
% Symbol '*' doesn't influence the result
% A string set containing null symbol '' will have the result '' as well

function lcp = LongestCommonPrefix(string_set)
%LONGESTCOMMONPREFIX Summary of this function goes here
%   Detailed explanation goes here
    lcp = '';
    endflag = 0;
    j = 1;
    i = 1;
    if isempty(string_set)
        lcp = 0;
        return;
    end
    while i <= length(string_set)
    % disgard all '*' symbols    
        if strcmp(string_set{i}, '*')
            string_set(i) = [];
            i = i - 1;
        end
        i = i + 1;
    end
    if isempty(string_set)
        lcp = 0;
        return;
    end
    while ~endflag
        tempchar = '';
        for i = 1:length(string_set)
            str = string_set{i};
            if strcmp(str, '')
                lcp = 0;
                return;
            end
            if strcmp(tempchar, '')
                tempchar = str(j);
                if length(str) == j
                    endflag = 1;
                end
            else
                if ~strcmp(str(j), tempchar)
                    endflag = 1;
                    if j == 1
                        lcp = 0;
                    end
                    return;
                end
                if length(str) == j
                    endflag = 1;
                end
            end                        
        end
        
        lcp = strcat(lcp, tempchar);
        j = j + 1;
    end

end

