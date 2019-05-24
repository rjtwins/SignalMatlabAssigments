% Jorre Vedder S4379101
% Signal analysis and MATLAB Assigment2

%Pick a number between 1 and 1000
Pickme = round(1000*rand(1));
Guessedcorrectly = 0;
tries = 0

%While there has not been a correct gues and there are tries left loop.
while Guessedcorrectly == 0 & tries < 10
    %Add up tries.
    tries = tries + 1
    %Get user input.
    A = input('Enter a number between 1 and 20')
    %if the try was correct remember so we exit the while loop
    %else display that it was incorrect.
    if A == Pickme
        Guessedcorrectly = 1;
    else
        disp('Wrong! Try again.')
    end
end

%If we exit the loop and there are no tries left, tell the user they have
%lost. Else the user will have won, display this.
if tries >= 10
    disp("You have expended your tries for today!")
else
    disp('Correct! You have picked the right nubmer!')
end