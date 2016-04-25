<font color='FF5B00'><h2> MDIStochasticFold </h2></font>
This function folds an isolated subtree from the merge operation to the rest of automata.

<font color='B80028'><h2> syntax </h2></font>
dffa = MDIStochasticFold(dffa, qr, qb)
<font color='B80028'><h2> Description </h2></font>
After merging, it's neccessary to fold the isolated subtree into original <br>
DFFA, this method recursively folds the subtree into DFFA <br>
Input: A DFFA which contains an seperated subtree rooted on a blue state, Red state qr, and Blue state qb.    <br>
Output: A updated Deterministic Frequency Finite Automaton (DFFA)<br>
<font color='B80028'><h2> See Also </h2></font>
<a href='MDIScore.md'>MDIScore</a>,<a href='MDI.md'>MDI</a>,<a href='MDIStochasticMerege.md'>MDIStochasticMerge</a>,<a href='MDICompatible.md'>MDICompatible</a>,<a href='AutomataSize.md'>AutomataSize</a>,<a href='ProbabilityOfString.md'>ProbabilityOfString</a>