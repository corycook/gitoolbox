# Introduction #
Evidence driven state merging is also called EDSM for abbreviation. It's another state merging algorithm <br>
similar with <a href='RPNI.md'>RPNI</a>. The only difference compared with RPNI is that EDSM introduces a count function <br>
which is used to evaluate the merged dfa, but not like RPNI greedily select the first accepted dfa for the <br>
next merge. That means EDSM requires more overhead on computing but provide more precise result.<br>
<br>
<h1>Function List</h1>
We've implemented following functions for RPNI:<br>
<ul><li><a href='EDSM.md'>EDSM</a>
</li><li><a href='EDSMCount.md'>EDSM_Count</a>
</li><li><a href='EDSMFold.md'>EDSM_FOLD</a>
</li><li><a href='EDSMMerge.md'>EDSM_MERGE</a>
</li><li><a href='EDSMPromote.md'>EDSM_PROMOTE</a>