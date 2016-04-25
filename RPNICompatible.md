<font color='FF5B00'><h2> RPNI_Compatible </h2></font>
Validate the compatibility of intermediate DFA of RPNI
<font color='B80028'><h2> Syntax </h2></font>
flag = RPNI\_COMPATIBLE(dfa, S\_negative)
<font color='B80028'><h2> Description </h2></font>
RPNI\_COMPATIBLE will take a DFA and S- (the set of negative samples) as inputes and check <br>
if any of the elements of S- is accepted by the DFA. It returns 1 if none of the elements of S- is <br>
accepted by the DFA and 0 otherwise.<br>
<font color='B80028'><h2> Example </h2></font>
<pre><code>flag = RPNI_COMPATIBLE(dfa, negative)<br>
ans = 1<br>
</code></pre>
<font color='B80028'><h2> See Also </h2></font>
<a href='RPNI.md'>RPNI</a>, <a href='RPNIFold.md'>RPNI_FOLD</a>, <a href='RPNIMerge.md'>RPNI_MERGE</a>, <a href='RPNIPromote.md'>RPNI_PROMOTE</a>