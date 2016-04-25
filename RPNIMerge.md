<font color='FF5B00'><h2> RPNI_MERGE </h2></font>
RPNI Merge
<font color='B80028'><h2> Syntax </h2></font>
dfa = RPNI\_MERGE(dfa, q1, q2)
<font color='B80028'><h2> Description </h2></font>
This method will merge two states. <br>
<b>input:</b> the <i>dfa</i>, state <i>q1</i> and <i>q2</i> to be merged, <i>q1</i> is a member of RED and <i>q2</i> is a member of BLUE <br>
<b>output:</b> the updated <i>dfa</i>  <br>
First of all, we find out the precedessor <i>(q_f)</i> of BLUE state <i>(q2)</i>, according to the principle of RPNI, this <br>
precedessor is unique. And then set the transition <i>(q_f, a)</i> as the RED state <i>(q1)</i>. After operations above, <br>
a tree rooted at <i>q2</i> will be isolated from <i>dfa</i>. Then we call <a href='RPNIFold.md'>RPNI_FOLD</a> to concatenate this tree onto<br>
current <i>dfa</i>.<br>
<b>RPNI_MERGE</b> returns an updated dfa.<br>
<font color='B80028'><h2> See Also </h2></font>
<a href='RPNI.md'>RPNI</a>, <a href='RPNICompatible.md'>RPNI_COMPATIBLE</a>, <a href='RPNIFold.md'>RPNI_FOLD</a>, <a href='RPNIPromote.md'>RPNI_PROMOTE</a>