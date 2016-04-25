<font color='FF5B00'><h2> AlergiaStochasticFold </h2></font>
This function folds an isolated subtree from the merge operation to the rest of automata.

<font color='B80028'><h2> syntax </h2></font>
dffa = AlergiaStochasticFold(dffa, qr, qb)
<font color='B80028'><h2> Description </h2></font>
After merging, it's neccessary to fold the isolated subtree into original <br>
DFFA, this method recursively folds the subtree into DFFA <br>
Input: A DFFA which contains an seperated subtree rooted on a blue state, Red state qr, and Blue state qb.    <br>
Output: A updated Deterministic Frequency Finite Automaton (DFFA)<br>
<font color='B80028'><h2> See Also </h2></font>
<a href='AlergiaTest.md'>AlergiaTest</a>,<a href='Alergia.md'>Alergia</a>,<a href='AlergiaStochasticMerge.md'>AlergiaStochasticMerge</a>,<a href='AlergiaCompatible.md'>AlergiaCompatible</a>,<a href='dffa2dpfa.md'>dffa2dpfa</a>,<a href='FreqOfState.md'>FreqOfState</a>