function dumpLatexAutomata(dfa, filename)
%DUMPLATEXAUTOMATA Summary of this function goes here
%   Detailed explanation goes here
    tm = dfa.TransitionMatrix;
    fd = fopen(filename, 'w');
    fprintf(fd, '%s', '\documentclass[11pt]{article}');
    fprintf(fd, '\n');
    fprintf(fd, '%s', '\usepackage{tikz}');
    fprintf(fd, '\n');
    fprintf(fd, '%s', '\usetikzlibrary{automata,positioning}');
    fprintf(fd, '\n');
    fprintf(fd, '%s', '\begin{document}');
    fprintf(fd, '\n');
    fprintf(fd, '%s', '\begin{tikzpicture}[>=latex, shorten >=1pt, node distance=1in, on grid, auto]');
    fprintf(fd, '\n');
    fprintf(fd, '%s', '% Vertices of automaton');
    fprintf(fd, '\n');
    setOfState = [1];
    tempset = setOfState;
    while (length(setOfState))
        node = setOfState(1);
        if (node == 1)
            fprintf(fd,'\\node [state,initial] (q%d) {$q_%d$};', node, node);
            fprintf(fd, '\n');
        else if (max(find(dfa.FinalAcceptStates == node)))
                fprintf(fd,'\\node [state, accepting] (q%d) [right=of q%d] {$q_%d$};', node, lastnode, node);
                fprintf(fd, '\n');
            else
                fprintf(fd,'\\node [state] (q%d) [right=of q%d] {$q_%d$};', node, lastnode, node);
                fprintf(fd, '\n');
            end
        end

        for i = 1:length(dfa.Alphabets)
            transit = dfa.TransitionMatrix(node, i);
            if (transit ~= 0)
                if (max(find(setOfState == transit)))
                    continue;
                else
                    setOfState = [setOfState; transit];
                    tempset = [tempset; transit];
                end
            end           
        end
        lastnode = setOfState(1);
        setOfState = setOfState(2:length(setOfState));
    end
    fprintf(fd, '%s', '% edges of automaton');
    fprintf(fd, '\n');
    fprintf(fd, '%s', '\path[->]'); 
    fprintf(fd, '\n');
    while (~isempty(tempset))
        node = tempset(1);
        for i = 1:length(dfa.Alphabets)
            alphabet = dfa.Alphabets{1,i};
            transit = dfa.TransitionMatrix(node, i);
            if (transit ~= 0)
                if (node == transit)
                    fprintf(fd, '(q%d) edge [loop above] node {%s} (q%d)', node, alphabet, transit);
                    fprintf(fd, '\n');
                else
                    fprintf(fd, '(q%d) edge node {%s} (q%d)', node, alphabet, transit);
                    fprintf(fd, '\n');
                end
            end
        end
        tempset = tempset(2:length(tempset));
    end
    fprintf(fd, ';');
    fprintf(fd, '\n');
    fprintf(fd, '%s', '\end{tikzpicture}');
    fprintf(fd, '\n');
    fprintf(fd, '%s', '\end{document}');
    fprintf(fd, '\n');
end

