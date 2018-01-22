function TrainingChecker( Q )
    close all
    figure('Name','Tic Tac Toe');
    plot(-1. -1)
    axis([0 3 0 3])
    set(gca,'xTick',0:3)
    set(gca,'yTick',0:3)
    set(gca,'xTickLabel','')
    set(gca,'yTickLabel','')
    xlabel('Player: X')
    grid on
    shg
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
terminalStateReached = false;
Table = [0 0 0 0 0 0 0 0 0];
actionMatrix = findActionsforStates(Table);
% prompt = ' Enter The location where you wish to add a "O":';

function [col row] = position(x, y)
    col = floor(x);
    row = floor(y);
    if col > 2 % if we're right on the 3 line, we count it as 2
        col = 2;
    end
    
    if row > 2
        row = 2;
    end
end


while(terminalStateReached == false)
%     userPosition = input(prompt);
    [x y] = ginput(1); % get the mouse position with respect to the plot
    [col row] = position(x, y); % get the corresponding row/col (note row starts off with 0 at the bottom)
     % the actual row within the state matrix
%      row=2-row;
     drawX(col, row);
    
    userPosition= givevalue(row, col);
    
    Table(userPosition) = 2;
    stateIndex = stateIndexForTable(Table);
%     fprintf('%d,',Table);fprintf('\n'); 
    [~,whoWonIfTerminal,isPresentStateTerminalState] = findRewardForAgentAction(stateIndex);
    % find the most greedy state for that state
    if(isPresentStateTerminalState == false)
    [stateIndex,~] = epsilonGreedyAction(Q(stateIndex,:),actionMatrix(stateIndex,:),0);
    % see if next state is terminal state
    [~,whoWonIfTerminal,isPresentStateTerminalState] = findRewardForAgentAction(stateIndex);
    end
    Table = tableForStateIndex(stateIndex);
%     fprintf('%d,',Table);fprintf('\n');
     [row col]= frompos(Table);
     
     
    % Episode Termination
    if(isPresentStateTerminalState == true)
        terminalStateReached = true;
        if(whoWonIfTerminal == 0)
%             fprintf('Robot Won\n');
            warndlg('O wins');
        title('O wins');
        xlabel('');
        elseif(whoWonIfTerminal == 1)
%             fprintf('You Won\n');
           warndlg('X wins');
        title('X wins');
        xlabel('');
        elseif(whoWonIfTerminal == 2)
%             fprintf('Match Draw\n');
             warndlg('Tie');
        title('Tie');
        xlabel('');
        end
    
    end
end

end

