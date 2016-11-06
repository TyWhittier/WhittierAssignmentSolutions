function guessThatNumber  
% ERROR 1 & 2
% name of function was guessThatNumber().  Since it takes no input
% arguments it does not need the () after it. I changed this in the
% function name and the comment usage description.
%---------------------------------------------------------------
%       USAGE: guessThatNumber
%
%        NAME:Tyler Whittier
%
%         DUE: October 27
%
%
% DESCRIPTION: This program is supposed to allow the user to play
%              the Number Guessing Game, however, it contains 12 bugs.
%              Your job is to find, correct, and mark the errors with
%              comments describing the bug, how you found it, 
%              and how you corrected it. Correct the bugs and submit this
%              corrected file on github.
%
%      INPUTS: None
%
%     OUTPUTS: None
%
%---------------------------------------------------------------

beginner = 1;               % beginner level #
moderate = 2;               % moderate level #
advanced = 3;               % advanced level #
beginnerHighest = 10;       % highest possible number for beginner
moderateHighest = 100;      % highest possible number for moderate
advancedHighest = 1000;     % highest possible number for advanced

% clear screen and display game introduction

clc()
fprintf(['Guess That Number Game \n\n', ...
'This program plays the game of Guess That Number in which you have to guess\n', ...
'a secret number.  After each guess you will be told whether your \n', ...
'guess is too high, too low, or correct.\n\n'])

% Get level of play (1-3) from user

fprintf('Please select one of the three levels of play:\n')
fprintf('   1) Beginner (range is 1 to %d)\n', beginnerHighest)
fprintf('   2) Moderate (range is 1 to %d)\n', moderateHighest)
fprintf('   3) Advanced (range is 1 to %d)\n', advancedHighest)

level = input('Enter level (1-3): '); 
% ERROR # 3
% Initially this while loop had OR statements in between conditions, making
% it impossible to get outside of the loop because you could never put all
% three values in.  I replaced this with && statements.  I found this by
% copy and pasting the conditional statement to see if it would ever give
% me a false return
while level ~= beginner && level ~= moderate && level ~= advanced       
fprintf('Sorry, that is not a valid level selection.\n')
level = input('Please re-enter a level of play (1-3): ');
end

% set highest secret number based on level selected

% ERROR #4
% comparative statements require 2 equals signs, otherwise it will assume
% you want to save a variable and return an error.  It previously only had
% one equals sign.  I put in 2.  I found the error by running the program
if level == beginner                     

    highest = beginnerHighest;

        elseif level == moderate
            highest = moderateHighest;
            % ERROR #2
            % the name of the variable is advancedHighest, the listed name was
            % advancedhighest with a lower case h.  I changed this.  I found this
            % simply by looking at the script
else
    highest = advancedHighest;          
end

% randomly select secret number between 1 and highest for level of play

secretNumber = floor(rand() * highest);     
% ERRORs 5 and 6
% The previous formula 'secretNumber = floor(rand() + 1 * highest)' would
% make the secret number 100 every time. rand() produces a decimal smaller
% than one.  Adding the product of one times the highest number is the same
% as adding it to the highest number. ERROR 5 is the inclusion on 1.
% ERROR 6 is using addition instead of multiplication.  
% Adding the highest value will result in a number outside of the range
% I found this by copy and
% pasting this formula into the command line and diagnosing the issue
% initialize number of guesses and User_guess

numOfTries = 0;
% ERROR 7
% numOfTries was originally 1.  Within the while loop it adds one to this
% number.  This makes it impossible to ever get it on the first try.  I
% found this by the command window telling me I got it on my second try
% when it was really my 1st
userGuess = 0;

% repeatedly get user's guess until the user guesses correctly

while userGuess ~= secretNumber

% get a valid guess (an integer from 1-Highest) from the user

fprintf('\nEnter a guess (1-%d): ', highest);
userGuess = input('');
%ERROR 8
%level range should include the highest number.  change this >= to >
while userGuess < 1 || userGuess > highest

fprintf('Sorry, that is not a valid guess.\nRe-enter a guess (1-%d): ', highest);

userGuess = input('');

end % of guess validation loop
% add 1 to the number of guesses the user has made

numOfTries = numOfTries + 1;

% report whether the user's guess was high, low, or correct
% ERROR 9
% if userGuess is larger than secretNumber, the number would be too high.
% This operator needs to be the other direction.  I changed userGuess >
% secretNumber to userGuess < secretNumber
if userGuess < secretNumber
fprintf('Sorry, %d is too low.\n', userGuess);
elseif userGuess > secretNumber 
fprintf('Sorry, %d is too high.\n', userGuess);
elseif numOfTries == 1
fprintf('\nLucky You!  You got it on your first try!\n\n');
else
fprintf('\nCongratulations!  You got %d in %d tries.\n\n', ...
secretNumber, numOfTries);
% ERROR 10
% the fprintf function calls for 2 inputs, one from the secretNumber
% function and one from the numOfTries but does not put that in the input
% arguments. included numOfTries after secretNumber.  I found this by
% noticing the incorrect output

fprintf('Game Over. Thanks for playing the Guess That Number game.\n\n');

end  % of guessing while
% ERROR # 11
% The written script did not have an END.  I found this by clicking RUN and
% reading the error message and changed it loop

end
% ERROR 12
% function did not have an end command
end

% end of game