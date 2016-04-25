clear;
clc;
fo = fopen('k_testable_result_500.txt', 'w+');
    
   for k = [2 3 5 10]
     
    display(k);
    fprintf(fo, 'k: ');
    fprintf(fo, '%g', k);
    fprintf(fo, '\n');
    x = cputime;
     %kset = KBuilder('./200.txt', k);
     dfa = K2dfa('./500.txt', k);
    y =  cputime - x
    fprintf(fo, 'time: ');
    fprintf(fo, '%g', y);
    fprintf(fo, '\n');
    fi = fopen('negative.txt', 'r');
    fi2 = fopen('500_test.txt', 'r');
    startindex = 0;
    fpos = 0;
    tneg = 0;
    tpos= 0;
    fneg= 0;
    while ~feof(fi)
        
        teststr2 = fgetl(fi2);
        teststr = fgetl(fi);
        
        if ~IsStringAccepted(teststr2, dfa)
        	%fprintf(fo, '0');
        	%fprintf(fo, '\n');
            fneg = fneg + 1;            
        else 
            %fprintf(fo, '1');
            %fprintf(fo, '\n');
            tpos = tpos + 1;
        end

        
        if ~IsStringAccepted(teststr, dfa)
        	%fprintf(fo, '0');
        	%fprintf(fo, '\n');
            tneg = tneg + 1;            
        else 
            %fprintf(fo, '1');
            %fprintf(fo, '\n');
            fpos = fpos + 1;
        end
    	startindex = 0;
    end

    fprintf(fo, 'false pos: ');
    fprintf(fo, '%g', fpos);
    fprintf(fo, '\n');
    fprintf(fo, 'true neg: ');
    fprintf(fo, '%g', tneg);
    fprintf(fo, '\n');
    fprintf(fo, 'true pos: ');
    fprintf(fo, '%g', tpos);
    fprintf(fo, '\n');
    fprintf(fo, 'false neg: ');
    fprintf(fo, '%g', fneg);  
    fprintf(fo, '\n');
    p = tpos/(tpos+fpos);
    fprintf(fo, 'precision: ');
    fprintf(fo, '%g', p);
    fprintf(fo, '\n');
    r = tpos/(tpos+fneg);
    fprintf(fo, 'recall: ');
    fprintf(fo, '%g', r);
    fprintf(fo, '\n');
    fclose(fi2);      
    fclose(fi);
   end
   fclose(fo);
  
   
   