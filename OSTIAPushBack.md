<font color='FF5B00'><h2> OSTIA_PushBack </h2></font>
Push back two states
<font color='B80028'><h2> Syntax </h2></font>
[T, flag] = OSTIA\_PushBack(T, q, p, a)
<font color='B80028'><h2> Description </h2></font>
This method can be thought of a symmetrical operation as Onward\_PTT. It <br>
pushes a portion of outputs forward to make up identical states so that <br>
they are able to merge. <br>
Input: TRANSDUCER T, two states q, p, alphabet index a <br>
Output: T -> New transducer setting u as the common outputs for both q and p, flag -> Indicator if push back is succeed <br>

<font color='B80028'><h2> See Also </h2></font>
<a href='OSTIAMerge.md'>OSTIA_Merge</a>,<a href='OSTIA.md'>OSTIA</a>,<a href='OSTIAFold.md'>OSTIA_Fold</a>,<a href='OSTIAOutputs.md'>OSTIA_Outputs</a>,<a href='Build_PTT.md'>Build_PTT</a>,<a href='LCP.md'>LongestCommonPrefix</a>,<a href='OnwardPTT.md'>Onward_PTT</a>