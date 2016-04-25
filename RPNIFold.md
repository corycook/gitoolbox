<font color='FF5B00'><h2> RPNI_Fold </h2></font>
RPNI Fold
<font color='B80028'><h2> Syntax </h2></font>
dfa = RPNI\_FOLD(dfa, q1, q2)
<font color='B80028'><h2> Description </h2></font>
This method will is a recursive fold function. It takes care of the non determinism of the DFA while merging two states.<br>
<b>input:</b> the dfa, state q1 and q2 to be merged. <br>
<b>output:</b> the updated DFA, where subtree in q2 is folded into q1. <br>

When we start to fold <i>q2</i> into <i>q1</i>, we check if <i>q2</i> belongs to final states, if it does, then <i>q1</i> should also be set as a final state.<br>
For each transition of <i>q2</i>: <i>(q2, a)</i> where <i>a</i> from the symbol set, <br>
1. if there's also a transition of <i>q1</i> with respect to the same symbol  <i>'a'</i> as <i>q2</i>, then we start to recursively fold <i>q2</i>'s <br>
transitioned state <i>(q2, a)</i> to <i>q1</i>'s transitioned state <i>(q1, a)</i>. <br>
2. if there's no corresponding transition in <i>q1</i>, then we delete this transition from <i>q2</i>, and meanwhile add it to <i>q1</i>. That means:<br>
<pre><code>(q1, a) &lt;- (q2, a)<br>
</code></pre>
Delete transition of <i>q2</i> to <i>(q2, a)</i> until there's no possible <b>RPNI_FOLD</b> <br>
<b>RPNI_FOLD</b> returns an new DFA.<br>
<font color='B80028'><h2> See Also </h2></font>
<a href='RPNI.md'>RPNI</a>, <a href='RPNICompatible.md'>RPNI_COMPATIBLE</a>, <a href='RPNIMerge.md'>RPNI_MERGE</a>, <a href='RPNIPromote.md'>RPNI_PROMOTE</a>