% Jorre Vedder S4379101
% Signal analysis and MATLAB Assigment2

%Initializing model varaibles.
%Pick a number between 1 and 100.
Pickme = round(100*rand(1));
Guessedcorrectly = 0;
tries = 0;
players = 5;

%While loop, as long as there has not been a correct gues and there are
%still tries left keep looping.
while Guessedcorrectly == 0 & tries < 10
    %Display current status.
    disp("A new rounds starts!")
    disp("There are")
    disp(10 - tries)
    disp("Rounds left")
    tries = tries + 1;
    
    %Loop over players to make a gues for this round.
    for i = 1:players
        A = input('Enter a number between 1 and 20 ');
        %If correct gues remember who made it.
        if A == Pickme
            Guessedcorrectly = i;
        end
    end
end

%When the loop is done if the tries where expended display this.
if tries >= 10
    disp("You have expended your tries for today!")
%Else there must have been a correct awnser guessed, display this.
else
    disp('Correct! The following player picked the right nubmer!')
    disp(Guessedcorrectly)
end