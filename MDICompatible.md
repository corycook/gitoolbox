<font color='FF5B00'><h2> MDICompatible </h2></font>
To see if two states are compatible for merge, this method merges <br>
two states first and check the score of merged automaton.<br>
<font color='B80028'><h2> syntax </h2></font>
<code>[correct, dffa_merged] = MDICompatible(dffa, qu, qv, sample, alpha)</code>
<font color='B80028'><h2> Description </h2></font>
To see if two states are compatible for merge. <br>
Input: A DFFA, two states qu, qv, sample set and a parameter alpha<br>
Output: A Boolean indicating if qu and qv are compatible, the merged dffa.<br>
<font color='B80028'><h2> See Also </h2></font>
<a href='MDI.md'>MDI</a>,<a href='MDIScore.md'>MDIScore</a>,<a href='MDIStochasticMerege.md'>MDIStochasticMerge</a>,<a href='MDIStochasticFold.md'>MDIStochasticFold</a>,<a href='AutomataSize.md'>AutomataSize</a>, <a href='ProbabilityOfString.md'>ProbabilityOfString</a>