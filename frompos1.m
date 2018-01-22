function [row col]= frompos(Table)
row=0;
col=0;
pos= find(Table==2);
for i=1:size(pos,2)
if    pos(i)==3
    row = 0;
    col=0;
elseif    pos(i)==5
    row = 1;
    col=1;
elseif    pos(i)==7
    row = 2;
    col=2;
elseif    pos(i)==6
    row = 0;
    col=1;
elseif    pos(i)==9
    row = 0;
    col=2;
elseif    pos(i)==2
    row = 1;
    col=0;
elseif    pos(i)==8
    row = 1;
    col=2;
elseif    pos(i)==1
    row = 2;
    col=0;
elseif    pos(i)==4
    row = 2;
    col=1;
end
drawX(col,2-row)
end

end
% function drawO(col, row)
%     hold on
%     t = 0:0.1:2*pi;
%     x = cos(t)/2+0.5;
%     y = sin(t)/2+0.5;
%     plot(x+col, y+row)
%     hold off
% end

