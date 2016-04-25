<font color='FF5B00'><h2> dffa2dpfa</h2></font>
Convert a deterministic frequency finite automata to deterministic probabilistic finite automata.
<font color='B80028'><h2> syntax </h2></font>
dffa = dpfa2dffa(dpfa, numOfStrings)
<font color='B80028'><h2> Description </h2></font>
This method converts a DPFA to a DFFA. This requires such condition <br>
fullfilled that the DPFA should be well defined which means the <br>
probability of strings entering and leaving a state should be identical. <br>
Input: a well defined DPFA, Number of total strings in sample <br>
Output: corresponding DFFA <br>
<font color='B80028'><h2> See Also </h2></font>
<a href='AlergiaCompatible.md'>AlergiaCompatible</a>,<a href='AlergiaTest.md'>AlergiaTest</a>,<a href='AlergiaStochasticMerge.md'>AlergiaStochasticMerge</a>,<a href='AlergiaStochasticFold.md'>AlergiaStochasticFold</a>,<a href='dffa2dpfa.md'>dffa2dpfa</a>,<a href='FreqOfState.md'>FreqOfState</a>