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
% -----------------------------


function c = LEXICALCMP(s1,s2)
% LEXCALCMP: string comparison (by lexical order or dictionary order)
%
% If S1 and S2 are strings, LEXCMP(S1,S2) returns:
%    -1,  S1 < S2
%     0,  S1 = S2
%     1,  S1 > S2
% where S1 and S2 are compared on the lexical order;
% S1 and S2 are strings or character arrays
%
%	See also STRCMP, STRCMPC.

L=min(numel(s1),numel(s2));
c=0;
i=1;
% find the first place where the strings differ
while (c==0)&&(i<=L),
  c=sign(s1(i)-s2(i));
  i=i+1;
end;

if c==0,
  % strings agree so far compare on lengths
  c=sign(numel(s1)-numel(s2));
end;

end