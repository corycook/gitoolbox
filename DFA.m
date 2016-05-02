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
% Here defines the data structure of Deterministic Finite Automaton (DFA).

classdef DFA
    % This class deinfes the DFA structure
    properties
        FiniteSetOfStates   % FiniteSetOfStates is the set of finite states denoted as Q
        Alphabets   % The set of alphabets
        TransitionMatrix  % The state transition matrix. Entry value 0 means there's no transition possible
        InitialState   % The set of initial states
        FinalAcceptStates   % The set of final accepted states
        FinalRejectStates  % The rejected states
        RED % The set of all the red states
        BLUE % The set of all the blue states
    end
    
    methods
        % This constructor is needed in case of implmenting RPNI version of Colin de la Higuera,
        % http://labh-curien.univ-st-etienne.fr/~cdlh/book/
        % Constructor
       function obj = DFA(q, a, tm, i, fa, fr, red, blue)
            obj.FiniteSetOfStates = q;
            obj.Alphabets = a;
            obj.TransitionMatrix = tm;
            obj.InitialState = i;
            obj.FinalAcceptStates = fa;
            obj.FinalRejectStates = fr;
            obj.RED = red;
            obj.BLUE = blue;
       end
       function [G, labels] = createDigraph(obj)
           [from, to, labels] = obj.createAdjacencyMatrix();
           G = digraph(from, to);
       end
       function [from, to, labels] = createAdjacencyMatrix(obj)
           alphabet = obj.Alphabets;
           transition = obj.TransitionMatrix;
           nsymbol = length(obj.Alphabets);
           initial = obj.InitialState;
           states = initial;
           queue = initial;
           from = [];
           to = [];
           labels = {};
           
           while ~isempty(queue)
               item = queue(1);
               queue(1) = []; %unshift
               from_state = find(states == item);
               for i = 1:nsymbol
                   next_state = transition(item, i);
                   to_state = find(states == next_state);
                   if next_state > 0 && isempty(to_state)
                       queue(end + 1) = next_state;
                       states(end + 1) = next_state;
                       to_state = length(states);
                   end
                   if next_state > 0 && ~any((to == to_state) & (from == from_state))
                       from(end + 1) = from_state;
                       to(end + 1) = to_state;
                       labels{end + 1} = alphabet{i};
                   end %if
               end %for
           end %while
       end % createAdjacencyMatrix
    end % methods
end % DFA

