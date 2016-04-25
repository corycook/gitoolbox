pr_1 = [0.3, 0.1, 0.6];
pr_2 = [0.8, 0.1, 0.1];
pr_3 = [0.1, 0.5, 0.4];
% pr_4 = [0.2, 0.2, 0.1, 0.5];
dist_1 = [];
dist_2 = [];
dist_3 = [];
% dist_4 = [];
% 0->halt 1->a 2->b 3->c
index1 = 100*pr_1(1);
index2 = 100*(pr_1(1)+pr_1(2));
%index3 = 100*(pr_1(1)+pr_1(2)+pr_1(3));
for i = 1:index1
    dist_1(i) = 0;
end
for i = (index1+1):index2
    dist_1(i) = 1;
end
for i = (index2+1):100
    dist_1(i) = 2;
end
% for i = (index3+1):100
%     dist_1(i) = 3;
% end

index1 = 100*pr_2(1);
index2 = 100*(pr_2(1)+pr_2(2));
% index3 = 100*(pr_2(1)+pr_2(2)+pr_2(3));
for i = 1:index1
    dist_2(i) = 0;
end
for i = (index1+1):index2
    dist_2(i) = 1;
end
for i = (index2+1):100
    dist_2(i) = 2;
end
% for i = (index3+1):100
%     dist_2(i) = 3;
% end

index1 = 100*pr_3(1);
index2 = 100*(pr_3(1)+pr_3(2));
% index3 = 100*(pr_3(1)+pr_3(2)+pr_3(3));
for i = 1:index1
    dist_3(i) = 0;
end
for i = (index1+1):index2
    dist_3(i) = 1;
end
for i = (index2+1):100
    dist_3(i) = 2;
end
% for i = (index3+1):100
%     dist_3(i) = 3;
% end

index1 = 100*pr_4(1);
index2 = 100*(pr_4(1)+pr_4(2));
% index3 = 100*(pr_4(1)+pr_4(2)+pr_4(3));
for i = 1:index1
    dist_4(i) = 0;
end
for i = (index1+1):index2
    dist_4(i) = 1;
end
for i = (index2+1):100
    dist_4(i) = 2;
end
% for i = (index3+1):100
%     dist_4(i) = 3;
% end

% start create data

fd = fopen('Data/alergia1.txt', 'w');
tm = [2, 3; 2, 3; 2, 1;];
for i = 1:1000
    state = 1;
    str = '';
    roll = dist_1(ceil(rand(1)*100));
    while(roll ~= 0)
        if (roll == 1)   % input 'a'
            str = strcat(str, 'a');
            state = tm(state, roll);
        end
        if (roll == 2)   % input 'b'
            str = strcat(str, 'b');
            state = tm(state, roll);
        end
%         if (roll == 3)   % input 'c'
%             str = strcat(str, 'c');
%             state = tm(state, roll);
%         end
        if (state == 1)
            roll = dist_1(ceil(rand(1)*100));
        end
        if (state == 2)
            roll = dist_2(ceil(rand(1)*100));
        end
        if (state == 3)
            roll = dist_3(ceil(rand(1)*100));
        end
%         if (state == 4)
%             roll = dist_4(ceil(rand(1)*100));
%         end
    end
   
    fprintf(fd, '%s', str);
    fprintf(fd, '\n');
end 
