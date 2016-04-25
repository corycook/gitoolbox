<font color='FF5B00'><h2> ProbabilityOfString </h2></font>
This function calculates the probability of a string to a DPFA.

<font color='B80028'><h2> syntax </h2></font>
prob = ProbabilityOfString(dpfa, str)
<font color='B80028'><h2> Description </h2></font>
Input a string to a DPFA, caculate the probability of this string. <br>
Using the chain rule, DPFA will return a probability of a string if it <br> can be accepted, unless the probability is zero. <br>
Input: A DPFA, a string <br>
Output: the probability of a string <br>

<font color='B80028'><h2> See Also </h2></font>
<a href='MDIScore.md'>MDIScore</a>,<a href='MDI.md'>MDI</a>,<a href='MDIStochasticFold.md'>MDIStochasticFold</a>,<a href='MDIStochasticMerege.md'>MDIStochasticMerge</a>,<a href='MDICompatible.md'>MDICompatible</a>,<a href='AutomataSize.md'>AutomataSize</a>