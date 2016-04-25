fd = fopen('Data/trans2.txt', 'w');
strset = {};
while length(strset) < 1000
    len = ceil(10*rand(1));
    str = '';
    for i=1:len
        alph = ceil(2*rand(1));
        if alph == 1
            str = strcat(str, 'a');
        else
            str = strcat(str, 'b');
        end
    end
    if find(strcmp(strset, str))
        continue;
    else
        strset{length(strset)+1} = str;
        output = Translate(trans, str);
        string = strcat(strcat(str,','),output);
        fprintf(fd, '%s', string);
        fprintf(fd, '\n');
    end
end

