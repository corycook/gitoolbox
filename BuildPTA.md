<font color='FF5B00'><h2> Build_PTA </h2></font>
Create PTA from positive samples
<font color='B80028'><h2> Syntax </h2></font>
PTA = BUILD\_PTA(training)
<font color='B80028'><h2> Description </h2></font>
Building PTA according to positive samples. Order positive samples lexically and create <br>
a list of all possible alphabets. Create prefix strings of all positive samples without any <br>
duplication. Add states corresponding to prefixes and add transitions to transition matrix.<br>
<font color='B80028'><h2> See Also </h2></font>
<a href='DFA.md'>DFA</a>, <a href='ReadSamples.md'>ReadSamples</a>, <a href='TraversedState.md'>TraversedState</a>