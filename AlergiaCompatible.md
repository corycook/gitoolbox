<font color='FF5B00'><h2> AlergiaCompatible </h2></font>
Test the compatibility of a merge.

<font color='B80028'><h2> syntax </h2></font>
correct = AlergiaCompatible(dffa, qu, qv, alpha)
<font color='B80028'><h2> Description </h2></font>
To see if two states are compatible for merge, this method call<br>
AlergiaTest as many times as needed.<br>
Input: A DFFA, two states qu, qv, and a parameter alpha<br>
Output: A Boolean indicating if qu and qv are compatible<br>
<font color='B80028'><h2> See Also </h2></font>
<a href='AlergiaTest.md'>AlergiaTest</a>,<a href='Alergia.md'>Alergia</a>,<a href='AlergiaStochasticMerge.md'>AlergiaStochasticMerge</a>,<a href='AlergiaStochasticFold.md'>AlergiaStochasticFold</a>,<a href='dffa2dpfa.md'>dffa2dpfa</a>,<a href='FreqOfState.md'>FreqOfState</a>