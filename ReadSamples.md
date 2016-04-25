<font color='FF5B00'><h2> ReadSamples </h2></font>
Create Positive and negative sets from samples
<font color='B80028'><h2> syntax </h2></font>
(training, group, positive\_samples, negative\_samples) = ReadSamples(file\_name)
<font color='B80028'><h2> Description </h2></font>
This function will load the sample as an input for the into a matlab array <br>
<ul><li><b>input:</b> <i>file_name</i> as an input it takes the file name<br>
</li><li><b>output:</b> <i>(training, group, negative_samples, positive_samples)</i>
</li><li><b>training:</b> This array contains all the training samples in the specified input file<br>
</li><li><b>group:</b> This array contains the corresponding classes of training<br>
</li><li><b>negative_samples:</b> This array contains all the negative samples of the training set<br>
</li><li><b>positive_samples:</b> This array contains all the positive samples of the training set<br>
<font color='B80028'><h2> See Also </h2></font>
<a href='DFA.md'>DFA</a>, <a href='BuildPTA.md'>Build_PTA</a>, <a href='TraversedState.md'>TraversedState</a>