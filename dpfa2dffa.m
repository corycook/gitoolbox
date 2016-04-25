% [Authors]: Hasan Ibne Akram, Huang Xiao
% [Institute]: Munich University of Technology
% [Web]: http://code.google.com/p/gitoolbox/
% [Emails]: hasan.akram@sec.in.tum.de, huang.xiao@mytum.de
% Copyright © 2010
% 
% ****** This is a beta version ****** 
% [DISCLAIMER OF WARRANTY]
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
% [Description]
% This method converts a DPFA to a DFFA. This requires such condition
% fullfilled that the DPFA should be well defined which means the
% probability of strings entering and leaving a state should be identical.
% Input: a well defined DPFA, Number of total strings in sample
% Output: corresponding DFFA

function dffa = dpfa2dffa(dpfa, numOfStrings)
%DPFA2DFFA converts DPFA to DFFA
    lenOfState = length(dpfa.FiniteSetOfStates);
    freq = [];
    SetOfState = dpfa.FiniteSetOfStates;
    alphabets = dpfa.Alphabets;
    ifr = [numOfStrings];
    ffr = [];
    ftm = {[],[]};
    ftm{1} = dpfa.ProbabilityTransitionMatrix{1};
    atm = dpfa.AssociateTransitionMatrix;
    red = dpfa.RED;
    blue = dpfa.BLUE;

    for i = 1:lenOfState
    end
    dffa = DFFA(SetOfState, alphabets, ifr, ffr, ftm, atm, red, blue);
end

