% 1. Load descend1.pl , turn on trace , and pose the query descend(anne,emily) . Count how many steps it takes Prolog to work out the answer (that is, how many times do you have to hit the return key). Now turn trace off and pose the query descend(X,Y) . How many answers are there?
%
% 25 steps and 10 answers.

% 2. Load descend2.pl . This is the variant of descend1.pl with the rule order reversed. Repeat the traces you have carried out for descend1.pl , and compare the results.
%
% 26 steps and 10 answers.

% 3. Load descend3.pl . This is the variant of descend2.pl in which the goal order within the recursive rule is switched, resulting in a left recursive rule. Because of this, even for such simple queries as descend(anne,bridget) , Prolog will not terminate. Step through an example, using trace , to confirm this.
%
% Confirmed:
% [debug]  ?- descend(anne,bridget).
% ERROR: Out of local stack
%   Exception: (1,675,218) descend(_G9126, bridget) ? abort
% Execution Aborted


% 4. Load descend4.pl . This is the variant of descend3.pl obtained by switching the rule order. So descend4.pl also contains a left recursive rule, and does not terminate on all input. But it does terminate on some input where descend3.pl does not. Which extra solutions does it find?
%
% Running the queries from the previous exercises, descend4 finds all the answers (unlike descend3, which fails both queries), but then fails to terminate.

% As we said in the text, goal ordering, not rule ordering is what is truly procedurally significant. But with non-terminating programs, rule ordering changes can have unexpected effects. Recall the successor program discussed in the text (let's call it numeral1.pl ):

   numeral(0). 
   numeral(succ(X))  :-  numeral(X).
% Let's swap the order of the two clauses, and call the result numeral2.pl :

   numeral(succ(X))  :-  numeral(X). 
   numeral(0).

% Clearly the declarative, or logical, content of this program is exactly the same as the earlier version. But what are the procedural differences, if any?
%
% From procedural perspective, numeral2 fails to respond to any queries involving a variable (e.g. numeral(X)) because it is unable to exit the recursive predicate listed first.  It is able to answer queries without a variable (e.g. numeral(succ(succ(succ(0))))).
%
% 1. Create a file containing numeral2.pl , load it, and investigate what happens if we pose queries about specific numerals. For example, suppose we ask:
%   numeral(succ(succ(succ(0)))).
% Do numeral1.pl and numeral2.pl behave in the same way on such input?
%
% Yes, they behave the same.

% 2. Second, look at what happens if we try to generate numerals, that is, suppose we pose the query
%   numeral(X).
% Do the programs display identical behaviour?
%
% No, numeral1 generates numerals indefinitely while numeral2 fails to generate any numerals.

% 1. Imagine that the following knowledge base describes a maze. The facts determine which points are connected, that is, from which points you can get to which other points in one step. Furthermore, imagine that all paths are one-way streets, so that you can only walk them in one direction. So, you can get from point 1 to point 2, but not the other way round.
   connected(1,2). 
   connected(3,4). 
   connected(5,6). 
   connected(7,8). 
   connected(9,10). 
   connected(12,13). 
   connected(13,14). 
   connected(15,16). 
   connected(17,18). 
   connected(19,20). 
   connected(4,1). 
   connected(6,3). 
   connected(4,7). 
   connected(6,11). 
   connected(14,9). 
   connected(11,15). 
   connected(16,12). 
   connected(14,17). 
   connected(16,19).
% Write a predicate path/2 that tells you from which points in the maze you can get to which other points when chaining together connections given in the above knowledge base. Can you get from point 5 to point 10? Which other point can you get to when starting at point 1? And which points can be reached from point 13

path(X, Y) :- connected(X, Y);
              connected(X, Z),
              path(Z, Y).

% [debug]  ?- path(1, Y).
% Y = 2 ;
% false.
%
% [debug]  ?- path(1, Y).
% Y = 2 ;
% false.

% 2. We are given the following knowledge base of travel information:

   byCar(auckland,hamilton). 
   byCar(hamilton,raglan). 
   byCar(valmont,saarbruecken). 
   byCar(valmont,metz). 
    
   byTrain(metz,frankfurt). 
   byTrain(saarbruecken,frankfurt). 
   byTrain(metz,paris). 
   byTrain(saarbruecken,paris). 
    
   byPlane(frankfurt,bangkok). 
   byPlane(frankfurt,singapore). 
   byPlane(paris,losAngeles). 
   byPlane(bangkok,auckland). 
   byPlane(singapore,auckland). 
   byPlane(losAngeles,auckland).

% Write a predicate travel/2 which determines whether it is possible to travel from one place to another by chaining together car, train, and plane journeys. For example, your program should answer yes to the query travel(valmont,raglan) .

travel(X, Y) :- byCar(X, Y);
                byTrain(X, Y);
                byPlane(X, Y);
                byCar(X, Z),
                travel(Z, Y);  
                byTrain(X, Z),
                travel(Z, Y);
                byPlane(X, Z),
                travel(Z, Y).

% 3. So, by using travel/2 to query the above database, you can find out that it is possible to go from Valmont to Raglan. If you are planning such a voyage, that's already something useful to know, but you would probably prefer to have the precise route from Valmont to Raglan. Write a predicate travel/3 which tells you which route to take when travelling from one place to another. For example, the program should respond
   X  =  go(valmont,metz, 
                 go(metz,paris, 
                       go(paris,losAngeles)))
to the query travel(valmont,losAngeles,X) .
%
% I need to come back to this one.  I do not understand how to solve.

% Extend the predicate travel/3 so that it not only tells you the route to take to get from one place to another, but also how you have to travel. That is, the new program should let us know, for each stage of the voyage, whether we need to travel by car, train, or plane.
%
% Since I cannot solve the above problem, I can't do this one yet.


