clc;
clear;
close all;
G=[[1 0 0 1 1 1 1]
   [0 1 0 1 0 1 0]
   [0 0 1 0 1 1 0]];

N=7;
k=3;

possibleCodes=[[0 0 0]
               [0 0 1]
               [0 1 0]
               [0 1 1]
               [1 0 0]
               [1 0 1]
               [1 1 0]
               [1 1 1]];

codeSet= mod(possibleCodes*G,2)

R=[1 1 0 0 1 1 0]; % recived message

for i= 1: length(possibleCodes)
    flag=1;
    for j = 1: length(R)
        if(codeSet(i,j)==R(j))
            flag=1;
        else
            flag=0;
            break;
        end
    end
    if(flag==1)
        disp('Recived message is correct');
        break;
    end
end

if(flag==0)
    disp('Recived message is incorrect');
end
