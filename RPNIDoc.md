# Introduction #
The RPNI is a state-merging algorithm in grammatical inference. It uses two labels <br>
for the states in the automaton: Red states and Blue states. After a series of merges <br>
between the red states and blue states, promoting the states (e.g., blue to red ), the <br>
target DFA is produced. For the details of RPNI please consult chapter 12 of the book <br>
<a href='Documentation#Reference.md'>Grammatical Inference: Learning Automata and Grammars.</a>.<br>
<br>
<h1>Function List</h1>
We've implemented following functions for RPNI:<br>
<ul><li><a href='RPNI.md'>RPNI</a>
</li><li><a href='RPNICompatible.md'>RPNI_COMPATIBLE</a>
</li><li><a href='RPNIFold.md'>RPNI_FOLD</a>
</li><li><a href='RPNIMerge.md'>RPNI_MERGE</a>
</li><li><a href='RPNIPromote.md'>RPNI_PROMOTE</a>