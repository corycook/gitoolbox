<font color='FF5B00'><h2> RPNI_PROMOTE </h2></font>
RPNI Promote
<font color='B80028'><h2> Syntax </h2></font>
(dfa, RED, BLUE) = RPNI\_PROMOTE(blue, dfa)
<font color='B80028'><h2> Description </h2></font>
Basically RPNI\_PROMOTE will promote a BLUE state to RED and add additional BLUE states <br>
to the set BLUE if necessary and return a <i>dfa</i> with update sets of RED and BLUE states. As <br>
optional output parameter it will also return the set of RED and the BLUE states. <br>
<br>
RPNI_PROMOTE(blue, dfa) needs two parameters:  <br>
<ul><li><i>'blue'</i> is the to be promoted blue state;  <br>
</li><li><i>'dfa'</i> is the DFA of the blue state; <br>
The blue state will be added to the current set of red states, and then all the existing successors <br>
of this blue state will be transformed to be blue states which are then added to the set of blue states.<br>
<font color='B80028'><h2> See Also </h2></font>
<a href='RPNI.md'>RPNI</a>, <a href='RPNICompatible.md'>RPNI_COMPATIBLE</a>, <a href='RPNIFold.md'>RPNI_FOLD</a>, <a href='RPNIMerge.md'>RPNI_MERGE</a>