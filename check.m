function [ robotWins,userWins,draw]= check(Q)


robotWins = 0;
userWins = 0;
draw = 0;

for i=1:1000
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

    terminalStateReached = false;
Table = [0 0 0 0 0 0 0 0 0];
Table1 = [0 0 0 0 0 0 0 0 0];
actionMatrix = findActionsforStates(Table);

    
while(terminalStateReached == false)
%     Player 1 plays
 stateIndex = stateIndexForTable(tttTable);
    stateIndex = randomAgentMove(actionsForState(stateIndex,:));
    [~,whoWonIfTerminal,isPresentStateTerminalState] = findRewardForAgentAction(stateIndex);
 if(isPresentStateTerminalState == false)
    [stateIndex,~] = epsilonGreedyAction(Q(stateIndex,:),actionMatrix(stateIndex,:),0);
    [~,whoWonIfTerminal,isPresentStateTerminalState] = findRewardForAgentAction(stateIndex);
 end
 Table = tableForStateIndex(stateIndex);
 frompos1(Table);
 pause(0.5);
 
 
  if(isPresentStateTerminalState == true)
            terminalStateReached = true;
            if(whoWonIfTerminal == 0)
                robotWins = robotWins + 1;
            elseif(whoWonIfTerminal == 1)
                userWins = userWins + 1;
            elseif(whoWonIfTerminal == 2)
                draw = draw + 1;
            end
  else
 %  Player 2 plays

 stateIndex = stateIndexForTable(Table);
 [~,whoWonIfTerminal,isPresentStateTerminalState] = findRewardForAgentAction(stateIndex);
%  if(isPresentStateTerminalState == false)
    [stateIndex,~] = epsilonGreedyAction(Q(stateIndex,:),actionMatrix(stateIndex,:),0);
    [~,whoWonIfTerminal,isPresentStateTerminalState] = findRewardForAgentAction(stateIndex);
%  end
 Table = tableForStateIndex(stateIndex);
 frompos(Table);
 pause(0.5);
 
  if(isPresentStateTerminalState == true)
            terminalStateReached = true;
            if(whoWonIfTerminal == 0)
                robotWins = robotWins + 1;
            elseif(whoWonIfTerminal == 1)
                userWins = userWins + 1;
            elseif(whoWonIfTerminal == 2)
                draw = draw + 1;
            end
  end
end

end
end
fprintf('Robot Wins: %d \nUser Wins: %d \nDraw: %d \n',...
    robotWins,userWins,draw);
end
