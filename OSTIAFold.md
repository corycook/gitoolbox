<font color='FF5B00'><h2> OSTIA_Fold </h2></font>
Folding function for OSTIA
<font color='B80028'><h2> Syntax </h2></font>
T = OSTIA\_Fold(T, qr, qb)
<font color='B80028'><h2> Description </h2></font>
Similar as other state merging algorithm, this method folds a tree rooted at a blue state to the rest of Transducer. <br>
Input: Transducer T, red state qr, blue state qb <br>
Output: Updated Transducer T into which qb has been folded. <br>
<font color='B80028'><h2> See Also </h2></font>
<a href='OSTIAMerge.md'>OSTIA_Merge</a>,<a href='OSTIA.md'>OSTIA</a>,<a href='OSTIAOutputs.md'>OSTIA_Outputs</a>,<a href='OSTIAPushBack.md'>OSTIA_PushBack</a>,<a href='Build_PTT.md'>Build_PTT</a>,<a href='LCP.md'>LongestCommonPrefix</a>,<a href='OnwardPTT.md'>Onward_PTT</a>