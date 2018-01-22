function pos = givevalue(row, col)
pos=0;
if (row == 0 && col==0)
    pos=3;
elseif (row==1&&col==1)
    pos=5;
elseif (row==2&&col==2)
    pos=7;
elseif (row==0&&col==1)
    pos=6;
elseif (row==0&&col==2)
    pos=9;
elseif (row==1&&col==0)
    pos=2;
elseif (row==1&&col==2)
    pos=8;
elseif (row==2&&col==0)
    pos=1;
elseif (row==2&&col==1)
    pos=4;
end
end
