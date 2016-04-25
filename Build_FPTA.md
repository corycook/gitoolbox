<font color='FF5B00'><h2> Build_FPTA </h2></font>
Create Frequency Preﬁx Tree Acceptor from samples
<font color='B80028'><h2> Syntax </h2></font>
[dffa, training\_set\_sorted, numOfSamples] = Build\_FPTA(filename)
<font color='B80028'><h2> Description </h2></font>
Building frequency prefix tree acceptor with respect to samples <br>
Only used for Alergia. <br>
Input: A set of samples <br>
Output: Deterministic Frequency Finite Automaton (DFFA), a sorted training set, total number of samples. <br>
<font color='B80028'><h2> See Also </h2></font>
<a href='DFA.md'>DFA</a>,<a href='DFFA.md'>DFFA</a>,<a href='DPFA.md'>DPFA</a>,<a href='BuildPTA.md'>Build_PTA</a>, <a href='ReadSamples.md'>ReadSamples</a>, <a href='TraversedState.md'>TraversedState</a>