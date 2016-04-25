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
% Read samples from file and convert it into a Ktestable language
% Input: filename,the path of sample file
%        k, the learning parameter k
% Output: return a K-testable language
% see also KSET, K2dfa

function kset = KBuilder(filename, k)
%KBUILDER Summary of this function goes here
%   Detailed explanation goes here
    alphabet = {};
    I = {};
    C = {};
    F = {};
    T = {};
    fd = fopen(filename);
    s = fgetl(fd);
    while (ischar(s))
    %   for i=1:length(positive)
        %s = positive{i,1};
        if length(s) < k
            if isequal(ismember([s], C), [1]) == 0
                C{1,length(C)+1} = s;
            end
        end
        if length(s) >= (k-1)
            if isequal(ismember([s(1:(k-1))], I), [1]) == 0
                I{1,length(I)+1} = s(1:(k-1));
            end
            if isequal(ismember([s((length(s)-k+2):length(s))], F), [1]) == 0               
                F{1,length(F)+1} = s((length(s)-k+2):length(s));
            end
        end
        if length(s) >= k
            for index = 1:(length(s)-k+1)
                if isequal(ismember([s(index:(index+k-1))], T), [1]) == 0
                    T{1,length(T)+1} = s(index:(index+k-1));
                end
            end
        end
        for i = 1:length(s)
            if isequal(ismember([s(i)], alphabet), [1]) == 0
                alphabet{1,length(alphabet)+1} = s(i);
            end
        end
        s = fgetl(fd);
    end
    kset = KSET(alphabet, I, C, F, T);
end


