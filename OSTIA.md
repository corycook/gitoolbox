<font color='FF5B00'><h2> OSTIA </h2></font>
OSTIA main function
<font color='B80028'><h2> Syntax </h2></font>
T = OSTIA(sample\_file)
<font color='B80028'><h2> Description </h2></font>
OSTIA stands for Onward Subsequential Transducer Inference Algorithm <br>
Given a dataset comprising pairs of input and output strings, OSTIA is able to learn a transducer from dataset in polynomial time. <br>
OSTIA starts with building a prefix tree transducer and make an onward operation on it, and then perform merging and folding processes to obtain a incompressible transducer.<br>
Input: Sample file name <br>
Output:  A transducer T <br>
<font color='B80028'><h2> See Also </h2></font>
<a href='OSTIAMerge.md'>OSTIA_Merge</a>,<a href='OSTIAFold.md'>OSTIA_Fold</a>,<a href='OSTIAOutputs.md'>OSTIA_Outputs</a>,<a href='OSTIAPushBack.md'>OSTIA_PushBack</a>,<a href='Build_PTT.md'>Build_PTT</a>,<a href='LCP.md'>LongestCommonPrefix</a>,<a href='OnwardPTT.md'>Onward_PTT</a>