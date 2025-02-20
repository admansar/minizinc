var 100..800: army;

constraint army mod 5 = 2;
constraint army mod 7 = 2;
constraint army mod 12 = 1;

solve satisfy;


% trying to find a solution where the number of solders ar between 100 
% and 800 and we know that with a row of 5 people the rest is 2
% with the row of 7 the rest is 2 and with the row of 12 the rest is 1
% there is no objective means just find a solution
% did not print ====== in the output means it may have some other solution
% that the model did not search even for
% so we should run: "minizinc --all-solutions count.mzn" if we want to see all
% the possible solutions

% remember: 	
%			-------- means there is a solution printed before
% 			======== no more solutions or the best one is there
