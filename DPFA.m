% [Authors]: Hasan Ibne Akram, Huang Xiao
% [Institute]: Munich University of Technology
% [Web]: http://code.google.com/p/gitoolbox/
% [Emails]: hasan.akram@sec.in.tum.de, huang.xiao@mytum.de
% Copyright ? 2010
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
% Here defines the data structure of Deterministic Probability Finite Automaton (DPFA).

classdef DPFA < DFA
    properties
        FinalStateProbability   % The probability set of final states
        ProbabilityTransitionMatrix   % The transition matrix of probability
        AssociateTransitionMatrix  % The associate transition matrix
    end
    
    methods
        function obj = DPFA(q, a, i, fsp, ptm, atm, red, blue)
            obj = obj@DFA(q,a,atm,i,fsp>0,[],red,blue);
            obj.FinalStateProbability = fsp;
            obj.ProbabilityTransitionMatrix = ptm;
            obj.AssociateTransitionMatrix = atm;
        end
        function obj = set.FinalStateProbability(obj, value)
            obj.FinalStateProbability = value;
            obj.FinalAcceptStates = find(value);
        end
        function obj = set.AssociateTransitionMatrix(obj, value)
            obj.AssociateTransitionMatrix = value;
            obj.TransitionMatrix = value;
        end
    end
end

