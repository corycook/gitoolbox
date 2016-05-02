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
% Here defines the data structure of Deterministic Frequency Finite Automaton (DFFA).

classdef DFFA < DFA
    properties
        InitialStateFrequency  % The frequency set of initial states
        FinalStateFrequency   % The frequency set of final states
        FrequencyTransitionMatrix   % The transition matrix of frequency
        AssociateTransitionMatrix  % The associate transition matrix
    end
    
    methods
        function obj = DFFA(q, a, ifr, ffr, ftm, atm, red, blue)
            obj = obj@DFA(q,a,atm,find(ifr),ffr > 0,[],red,blue);
            obj.InitialStateFrequency = ifr;
            obj.FinalStateFrequency = ffr;
            obj.FrequencyTransitionMatrix = ftm;
            obj.AssociateTransitionMatrix = atm;
        end
        function obj = set.FinalStateFrequency(obj, value)
            obj.FinalStateFrequency = value;
            obj.FinalAcceptStates = find(value);
        end
        function obj = set.AssociateTransitionMatrix(obj, value)
            obj.AssociateTransitionMatrix = value;
            obj.TransitionMatrix = value;
        end
    end
end

