%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Assignment4.
%Tyler Whittier
%Septembe4 24, 2015
%  This is a code for an application that plays the game tic tac toe
%  This tic tac toe application allows the user to compete against the computer
%  To try and get three x's in a row before the computer gets three O's
%  In a row.  Users input their answer as a coordinate with a column and
%  row value. This is the second version of this game with for and while
%  loops included

% This code opens a welcome message and asks the user to click a push
% button in order to start
%Set the parameters of the figure
Z = figure('Visible', 'off','Color', [.75 .75 .11], 'Position', [300,400,500,500]);
htext = uicontrol('Style','text','Position',[200,200,100,100], 'String','Howdy Friend, Thanks fer playin TIC TAC TOE. Push the button below and we ll gitcha started ','fontsize', 20);
set(Z, 'Name','TicTacToe')
%Move figure to center of screen
movegui(Z,'center')
% Creates the button that closes the figure and labels it
hbutton = uicontrol('Style','pushbutton','String','Click This lil feller','Position',[170,50,150,50],'Callback','close');
set(Z,'Visible','on')
%The rest of the code will remain running so we pause it until the button
%is clicked
waitforbuttonpress
close all
%After the user has pushed the button a new message comes up giving
%directions about how to play and once again requiring a pushbutton to
%continue
Y = figure('Visible', 'off','Color', [.75 .75 .11], 'Position', [300,400,500,500]);
htext = uicontrol('Style','text','Position',[200,200,100,200], 'String','Alright Partner, heres how it works, the goal is to get three in a row Before I do.  You can accomplish this with three Xs Straight up, straight across, or diagonal.  You may go first, then I go and we continue until we tie or someone wins!');
set(Y, 'Name','TicTacToe2')
movegui(Y,'center')
hbutton = uicontrol('Style','pushbutton','String','lets do er to er','Position',[170,50,150,50],'Callback','close');
set(Y,'Visible','on')
waitforbuttonpress
close all

%this is the beginning of the play setting.  This is where the game
%re-starts if the user decides to play again.  Winner is the variable that
%the loop recognizes to keep looping so our first job is to create 'winner'
winner = 45
while (winner == 45)
figure
%create an x and y vector where our boxes will go on the axis
x = [1 2 3 1 2 3 1 2 3];
y = [1 1 1 2 2 2 3 3 3];
%To make it easier later, I am giving each matrix point an alphabet
%variable name
a = [x(1), y(1)];
b = [x(4), y(4)];
c = [x(7), y(7)];
d = [x(2), y(2)];
e = [x(5), y(5)];
f = [x(8), y(8)];
g = [x(3), y(3)];
h = [x(6), y(6)];
i = [x(9), y(9)];
%plot the vectors with a square box
board = plot(x,y, 'ks', 'MarkerSize', 70)
%axis(ij) puts the axis in matrix mode so that the value (1,1) is top left
%not bottom left
axis('ij');
%grid marks on
grid('off');
%axis(equal) brings the squares into the middle
axis('equal');
axis('off')
%extend the axis so that the boxes fit
axis([0 4 0 4]);
%Label all the rows
text(0.2, 1, '1','fontsize',20)
text(0.2, 2, '2','fontsize',20)
text(0.2, 3, '3','fontsize',20)
%label the columns
text(.9, 3.7,'1','fontsize',20)
text(1.9, 3.7,'2','fontsize',20)
text(2.9, 3.7,'3','fontsize',20)
%in order to use a for loop I created a countdown to play for the user.  It
%loops 5 times counting down in increments of 1
H= text(1,0.3, 'We start playing in:', 'fontsize', 20)
pause(2)
delete(H)
for k=5:-1:1
H= text(1,0.3, num2str(k), 'fontsize', 20)
pause(.75)
delete(H)
end
%Tell user which marker is theirs and then disappear after 2 seconds
H= text(0.45,0.3, 'X = You, O = Computer', 'fontsize', 20)
pause(2)
delete(H)
%hold on makes sure the board doesn't get messed up
hold('on')


%Prompt user for 2 coordinates of their first move
prompt = {'ROW 1,2,3','COLUMN 1,2,3'};
name = 'Enter your choice';
move1 = inputdlg(prompt,name);
%as entered the values are strings. str2num switches them to a double
move1col = str2num(move1{2});
move1row = str2num(move1{1});
%Assign two coordinates to a variable vector
move1 = [move1col move1row];
%plot a red x where the user chose
plot(move1col,move1row,'-xr', 'markersize',40,'linewidth',2);
pause(1)
% The above is all to make their choice visible, we now make an invisible
% 3X3 matrix where their choices are plotted 
playerboard = zeros(3);
if move1 == [1,1]
    playerboard(1) = 1
else if move1 == [1,2]
        playerboard(2) = 1
    else if move1 == [1,3]
            playerboard(3) = 1
        else if move1 == [2,1]
                playerboard(4) = 1
            else if move1 == [2,2]
                    playerboard(5) = 1
                else if move1 == [2,3]
                        playerboard(6)= 1
                    else if move1 == [3,1]
                            playerboard(7) = 1
                        else if move1 == [3,2]
                                playerboard(8) = 1
                            else if move1 == [3,3]
                                    playerboard(9) = 1
                                end 
                            end
                        end
                    end
                end
            end
        end
    end
end


                          
%Tell the user that the computer will now go
H = text(0.1, 3.5, 'Interesting choice. Ok, my turn', 'fontsize',20);
pause(2)
delete(H)
%generate a new move
move2col = randi([1,3]);
move2row = randi([1,3]);
move2 = [move2col move2row]
%The following while loop's purpose is to generate a new location if the
%random position chosen is already taken
while move2(:)== move1(:)
move2col = randi([1,3]);
move2row = randi([1,3]);
move2 = [move2col move2row];
end
%plot move 2
plot(move2col,move2row,'-ob', 'markersize',40,'linewidth',2);
hold('on')
%the same is done with the computer board.  A separate board is created for
%both the player and the computer that only plots their choices. This will
%come in handy after the fifth turn when we are trying to decide if there
%is a winner
compboard = zeros(3);
if move2 == [1,1]
    compboard(1) = 1
else if move2 == [1,2]
        compboard(2) = 1
    else if move2 == [1,3]
            compboard(3) = 1
        else if move2 == [2,1]
                compboard(4) = 1
            else if move2 == [2,2]
                    compboard(5) = 1
                else if move2 == [2,3]
                        compboard(6)= 1
                    else if move2 == [3,1]
                            compboard(7) = 1
                        else if move2 == [3,2]
                                compboard(8) = 1
                            else if move2 == [3,3]
                                    compboard(9) = 1
                                end 
                            end
                        end
                    end
                end
            end
        end
    end
end

%prompt the user for a new move
H= text(0.45,0.3, 'Your turn once again', 'fontsize', 20)
pause(2)
delete(H)
%ask for users move once again
prompt = {'ROW 1,2,3','COLUMN 1,2,3'};
name = 'Enter your choice';
move3 = inputdlg(prompt,name);
move3col = str2num(move3{2});
move3row = str2num(move3{1});
move3 = [move3col move3row];
%this while loop will continue to cycle if the user enters a spot that has
%already been taken
while (move3(1) == move2(1) && move3(2) == move2(2)) || (move3(1) == move1(1) && move3(2) == move1(2))
H = text(0.1, 3.5, 'That thar is an invalid entry, try again', 'fontsize',20);
pause(2)
delete(H)
prompt = {'ROW 1,2,3','COLUMN 1,2,3'};
name = 'Enter your choice';
move3 = inputdlg(prompt,name);
move3col = str2num(move3{2});
move3row = str2num(move3{1});
move3 = [move3col move3row];
delete(H)
end


plot(move3col,move3row,'-xr', 'markersize',40,'linewidth',2);
pause(1)
%same protocol to plot their choice on their own invisible 3X3 Matrix
if move3 == [1,1]
    playerboard(1) = 1
else if move3 == [1,2]
        playerboard(2) = 1
    else if move3 == [1,3]
            playerboard(3) = 1
        else if move3 == [2,1]
                playerboard(4) = 1
            else if move3 == [2,2]
                    playerboard(5) = 1
                else if move3 == [2,3]
                        playerboard(6)= 1
                    else if move3 == [3,1]
                            playerboard(7) = 1
                        else if move3 == [3,2]
                                playerboard(8) = 1
                            else if move3 == [3,3]
                                    playerboard(9) = 1
                                end 
                            end
                        end
                    end
                end
            end
        end
    end
end
%Computer generates move #4
move4col = randi([1,3]);
move4row = randi([1,3]);
move4 = [move4col move4row];
% No repeated choices
while (move4(1) == move1(1) && move4(2) == move1(2)) || (move4(1) == move2(1) && move4(2) == move2(2))...
        || (move4(1) == move3(1) && move4(2) == move3(2))
move4col = randi([1,3]);
move4row = randi([1,3]);
move4 = [move4col move4row]
end
move4;
plot(move4(1),move4(2),'-ob', 'markersize',40,'linewidth',2);
hold('on')
%plot it on the computer's invisible matrix
if move4 == [1,1]
    compboard(1) = 1
else if move4 == [1,2]
        compboard(2) = 1
    else if move4 == [1,3]
            compboard(3) = 1
        else if move4 == [2,1]
                compboard(4) = 1
            else if move4 == [2,2]
                    compboard(5) = 1
                else if move4 == [2,3]
                        compboard(6)= 1
                    else if move4 == [3,1]
                            compboard(7) = 1
                        else if move4 == [3,2]
                                compboard(8) = 1
                            else if move4 == [3,3]
                                    compboard(9) = 1
                                end 
                            end
                        end
                    end
                end
            end
        end
    end
end
%prompt user for move number 5
H= text(0.45,0.3, 'Your turn once again', 'fontsize', 20)
pause(2)
delete(H)
hold('on')
prompt = {'ROW 1,2,3','COLUMN 1,2,3'};
name = 'Enter your choice';
move5 = inputdlg(prompt,name);
move5col = str2num(move5{2});
move5row = str2num(move5{1});
move5 = [move5col move5row];

while (move5(1) == move2(1) && move5(2) == move2(2)) || (move5(1) == move1(1) && move5(2) == move1(2))...
   || (move5(1) == move3(1) && move5(2) == move3(2)) || (move5(1) == move4(1) && move5(2) == move4(2))   
H = text(0.1, 3.5, 'That thar is an invalid entry, try again', 'fontsize',20);
pause(2)
delete(H)
prompt = {'ROW 1,2,3','COLUMN 1,2,3'};
name = 'Enter your choice';
move5 = inputdlg(prompt,name);
move5col = str2num(move5{2});
move5row = str2num(move5{1});
move5 = [move5col move5row];
delete(H)
end
plot(move5col,move5row,'-xr', 'markersize',40,'linewidth',2);
hold('on')

if move5 == [1,1]
    playerboard(1) = 1
else if move5 == [1,2]
        playerboard(2) = 1
    else if move5 == [1,3]
            playerboard(3) = 1
        else if move5 == [2,1]
                playerboard(4) = 1
            else if move5 == [2,2]
                    playerboard(5) = 1
                else if move5 == [2,3]
                        playerboard(6)= 1
                    else if move5 == [3,1]
                            playerboard(7) = 1
                        else if move5 == [3,2]
                                playerboard(8) = 1
                            else if move5 == [3,3]
                                    playerboard(9) = 1
                                end 
                            end
                        end
                    end
                end
            end
        end
    end
end
pause(1)
%On the fifth move it is now possible to have a winner. The following if statement determines
%if there is a winner by adding up the rows and columns of their invisible
%matrix with 0s and 1s for their choices.  if a column, row or diagonal
%adds up to 3 than they have won.  From there a message pops up
%congratulating the participant afterwhich they are asked to play again
if ((sum(playerboard(1,:))) == 3) || ((sum(playerboard(2,:))) == 3) || ((sum(playerboard(3,:))) == 3)...
        || ((sum(playerboard(:,1))) == 3) || ((sum(playerboard(:,2))) == 3)|| ((sum(playerboard(:,3))) == 3)...
        || ((playerboard(1) + playerboard(5) + playerboard(9)) == 3) || ((playerboard(3) + playerboard(5) + playerboard(7)) == 3)
    H = text(0.1, 3.5, 'You Won!! Nice Job Chief!', 'fontsize',20);
    pause(2)
    delete(H)
    prompt = {'1 = Yes, 0 = No'};
    name = 'Play Again?';
    play_again = inputdlg(prompt,name);
    play_again = str2num(play_again{1})
    %the play again window asks for 1 if yes and 0 if no.  This makes the if
    %statement below work.  If a 1 is entered, the variable "winner" is reset
    %to 45 which loops back to the beginning of play and continues in that
    %fashion until they decide not to play again
        if play_again == 1
        close all
        winner = 45
        continue
        elseif play_again == 0
        H = text(-1, 3.5, 'Ok, you have yourself a good day. Take care now', 'fontsize',20);
        pause(2)
        delete(H)
        winner = 43
        close all
        break
        end
end
  
  
    
 %For moves 6-8 it is the same design as 5.  The only difference is that the new filled spots are added to the while loop eliminating them as possibilities.   
    
    move6col = randi([1,3]);
move6row = randi([1,3]);
move6 = [move6col move6row]
while  (move6(1) == move1(1) && move6(2) == move1(2)) || (move6(1) == move2(1) && move6(2) == move2(2)) || (move6(1) == move3(1) && move6(2) == move3(2))...
   || (move6(1) == move4(1) && move6(2) == move4(2)) || (move6(1) == move5(1) && move6(2) == move5(2))

move6col = randi([1,3]);
move6row = randi([1,3]);
move6 = [move6col move6row]
end
plot(move6col,move6row,'-ob', 'markersize',40,'linewidth',2);
if move6 == [1,1]
    compboard(1) = 1
else if move6 == [1,2]
        compboard(2) = 1
    else if move6 == [1,3]
            compboard(3) = 1
        else if move6 == [2,1]
                compboard(4) = 1
            else if move6 == [2,2]
                    compboard(5) = 1
                else if move6 == [2,3]
                        compboard(6)= 1
                    else if move6 == [3,1]
                            compboard(7) = 1
                        else if move6 == [3,2]
                                compboard(8) = 1
                            else if move6 == [3,3]
                                    compboard(9) = 1
                                end 
                            end
                        end
                    end
                end
            end
        end
    end
end
if ((sum(compboard(1,:))) == 3) || ((sum(compboard(2,:))) == 3) || ((sum(compboard(3,:))) == 3)...
        || ((sum(compboard(:,1))) == 3) || ((sum(compboard(:,2))) == 3)|| ((sum(compboard(:,3))) == 3)...
        || ((compboard(1) + compboard(5) + compboard(9)) == 3) || ((compboard(3) + compboard(5) + compboard(7)) == 3)
    H = text(0.1, 3.5, 'I Win! Sorry Partner', 'fontsize',20);
    pause(2)
    delete(H)
    prompt = {'1 = Yes, 0 = No'};
    name = 'Play Again?';
    play_again = inputdlg(prompt,name);
    play_again = str2num(play_again{1})
        if play_again == 1
        close all
        winner = 45
        continue
        elseif play_again == 0
        H = text(-1, 3.5, 'Ok, you have yourself a good day. Take care now', 'fontsize',20);
        pause(2)
        delete(H)
        close all
        break
        end
end
H= text(0.45,0.3, 'Your turn once again', 'fontsize', 20)
pause(2)
delete(H)
hold('on')
prompt = {'ROW 1,2,3','COLUMN 1,2,3'};
name = 'Enter your choice';
move7 = inputdlg(prompt,name);
move7col = str2num(move7{2});
move7row = str2num(move7{1});
move7 = [move7col move7row];

while  (move7(1) == move1(1) && move7(2) == move1(2)) || (move7(1) == move2(1) && move7(2) == move2(2)) || (move7(1) == move3(1) && move7(2) == move3(2))...
   || (move7(1) == move4(1) && move7(2) == move4(2)) || (move7(1) == move5(1) && move7(2) == move5(2)) || (move7(1) == move6(1) && move7(2) == move6(2))

H = text(0.1, 3.5, 'That thar is an invalid entry, try again', 'fontsize',20);
pause(2)
delete(H)
prompt = {'ROW 1,2,3','COLUMN 1,2,3'};
name = 'Enter your choice';
move7 = inputdlg(prompt,name);
move7col = str2num(move7{2});
move7row = str2num(move7{1});
move7 = [move7col move7row];
delete(H)
end
plot(move7col,move7row,'-xr', 'markersize',40,'linewidth',2);
if move7 == [1,1]
    playerboard(1) = 1
else if move7 == [1,2]
        playerboard(2) = 1
    else if move7 == [1,3]
            playerboard(3) = 1
        else if move7 == [2,1]
                playerboard(4) = 1
            else if move7 == [2,2]
                    playerboard(5) = 1
                else if move7 == [2,3]
                        playerboard(6)= 1
                    else if move7 == [3,1]
                            playerboard(7) = 1
                        else if move7 == [3,2]
                                playerboard(8) = 1
                            else if move7 == [3,3]
                                    playerboard(9) = 1
                                end 
                            end
                        end
                    end
                end
            end
        end
    end
end
if ((sum(playerboard(1,:))) == 3) || ((sum(playerboard(2,:))) == 3) || ((sum(playerboard(3,:))) == 3)...
        || ((sum(playerboard(:,1))) == 3) || ((sum(playerboard(:,2))) == 3)|| ((sum(playerboard(:,3))) == 3)...
        || ((playerboard(1) + playerboard(5) + playerboard(9)) == 3) || ((playerboard(3) + playerboard(5) + playerboard(7)) == 3)
    H = text(0.1, 3.5, 'You Won!! Nice Job Chief!', 'fontsize',20);
    pause(2)
    delete(H)
    prompt = {'1 = Yes, 0 = No'};
    name = 'Play Again?';
    play_again = inputdlg(prompt,name);
    play_again = str2num(play_again{1})
        if play_again == 1
        close all
        winner = 45
        continue
        elseif play_again == 0
        H = text(-1, 3.5, 'Ok, you have yourself a good day. Take care now', 'fontsize',20);
        pause(2)
        delete(H)
        clear all
        close all
        break
    end
end

pause(2)

move8col = randi([1,3]);
move8row = randi([1,3]);
move8 = [move8col move8row]
while (move8(1) == move1(1) && move8(2) == move1(2)) || (move8(1) == move2(1) && move8(2) == move2(2)) || (move8(1) == move3(1) && move8(2) == move3(2))...
   || (move8(1) == move4(1) && move8(2) == move4(2)) || (move8(1) == move5(1) && move8(2) == move5(2)) || (move8(1) == move6(1) && move8(2) == move6(2))...
   || (move8(1) == move7(1) && move8(2) == move7(2))

move8col = randi([1,3]);
move8row = randi([1,3]);
move8 = [move8col move8row]
end
plot(move8col,move8row,'-ob', 'markersize',40,'linewidth',2);
if move8 == [1,1]
    compboard(1) = 1
else if move8 == [1,2]
        compboard(2) = 1
    else if move8 == [1,3]
            compboard(3) = 1
        else if move8 == [2,1]
                compboard(4) = 1
            else if move8 == [2,2]
                    compboard(5) = 1
                else if move8 == [2,3]
                        compboard(6)= 1
                    else if move8 == [3,1]
                            compboard(7) = 1
                        else if move8 == [3,2]
                                compboard(8) = 1
                            else if move8 == [3,3]
                                    compboard(9) = 1
                                end 
                            end
                        end
                    end
                end
            end
        end
    end
end
pause(1)
if ((sum(compboard(1,:))) == 3) || ((sum(compboard(2,:))) == 3) || ((sum(compboard(3,:))) == 3)...
        || ((sum(compboard(:,1))) == 3) || ((sum(compboard(:,2))) == 3)|| ((sum(compboard(:,3))) == 3)...
        || ((compboard(1) + compboard(5) + compboard(9)) == 3) || ((compboard(3) + compboard(5) + compboard(7)) == 3)
    H = text(0.1, 3.5, 'I Win! Sorry Partner', 'fontsize',20);
    pause(2)
    delete(H)
    prompt = {'1 = Yes, 0 = No'};
    name = 'Play Again?';
    play_again = inputdlg(prompt,name);
    play_again = str2num(play_again{1})
        if play_again == 1
        close all
        winner = 45
        continue
        elseif play_again == 0
        H = text(-1, 3.5, 'Ok, you have yourself a good day. Take care now', 'fontsize',20);
        pause(2)
        delete(H)
        clear all
        close all
        break
        end
end



H= text(0.45,0.3, 'Your turn once again', 'fontsize', 20)
pause(2)
delete(H)
hold('on')
prompt = {'ROW 1,2,3','COLUMN 1,2,3'};
name = 'Enter your choice';
move9 = inputdlg(prompt,name);
move9col = str2num(move9{2});
move9row = str2num(move9{1});
move9 = [move9col move9row];

while (move9(1) == move1(1) && move9(2) == move1(2)) || (move9(1) == move2(1) && move9(2) == move2(2)) || (move9(1) == move3(1) && move9(2) == move3(2))...
   || (move9(1) == move4(1) && move9(2) == move4(2)) || (move9(1) == move5(1) && move9(2) == move5(2)) || (move9(1) == move6(1) && move9(2) == move6(2))...
   || (move9(1) == move7(1) && move9(2) == move7(2)) || (move9(1) == move8(1) && move9(2) == move8(2))


H = text(0.1, 3.5, 'That thar is an invalid entry, try again', 'fontsize',20);
pause(2)
delete(H)
prompt = {'ROW 1,2,3','COLUMN 1,2,3'};
name = 'Enter your choice';
move9 = inputdlg(prompt,name);
move9col = str2num(move9{2});
move9row = str2num(move9{1});
move9 = [move9col move9row];
delete(H)
end
plot(move9col,move9row,'-xr', 'markersize',40,'linewidth',2);
if move9 == [1,1]
    playerboard(1) = 1
else if move9 == [1,2]
        playerboard(2) = 1
    else if move9 == [1,3]
            playerboard(3) = 1
        else if move9 == [2,1]
                playerboard(4) = 1
            else if move9 == [2,2]
                    playerboard(5) = 1
                else if move9 == [2,3]
                        playerboard(6)= 1
                    else if move9 == [3,1]
                            playerboard(7) = 1
                        else if move9 == [3,2]
                                playerboard(8) = 1
                            else if move9 == [3,3]
                                    playerboard(9) = 1
                                end 
                            end
                        end
                    end
                end
            end
        end
    end
end
if ((sum(playerboard(1,:))) == 3) || ((sum(playerboard(2,:))) == 3) || ((sum(playerboard(3,:))) == 3)...
        || ((sum(playerboard(:,1))) == 3) || ((sum(playerboard(:,2))) == 3)|| ((sum(playerboard(:,3))) == 3)...
        || ((playerboard(1) + playerboard(5) + playerboard(9)) == 3) || ((playerboard(3) + playerboard(5) + playerboard(7)) == 3)
    H = text(0.1, 3.5, 'You Won!! Nice Job Chief!', 'fontsize',20);
    pause(2)
    delete(H)
    prompt = {'1 = Yes, 0 = No'};
    name = 'Play Again?';
    play_again = inputdlg(prompt,name);
    play_again = str2num(play_again{1})
        if play_again == 1
        close all
        winner = 45
        continue
        elseif play_again == 0
        H = text(-1, 3.5, 'Ok, you have yourself a good day. Take care now', 'fontsize',20);
        pause(2)
        delete(H)
        clear all
        close all
        break
        end


    %If we get to this point and do not have a winner than we have a draw.  The
    %folowing message will be displayed and they will be asked if they woould
    %like to play again.
    else  H = text(-1, 3.5, 'Looks like its a draw', 'fontsize',20);
    pause(2)
    delete(H)
    prompt = {'1 = Yes, 0 = No'};
    name = 'Play Again?';
    play_again = inputdlg(prompt,name);
    play_again = str2num(play_again{1})
        if play_again == 1
        close all
        winner = 45
        continue
        elseif play_again == 0
        H = text(-1, 3.5, 'Ok, you have yourself a good day. Take care now', 'fontsize',20);
        pause(2)
        delete(H)
        clear all
        close all
        break
        end
end
end
