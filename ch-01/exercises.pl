% Exercise  1.1 Which of the following sequences of characters are atoms, which are variables, and which are neither?
%
% vINCENT                 Atom
% Footmassage             Variable
% variable23              Atom
% Variable2000            Variable
% big_kahuna_burger       Atom
% 'big  kahuna  burger'   Atom
% big  kahuna  burger     Neither
% 'Jules'                 Atom
% _Jules                  Variable
% '_Jules'                Atom

% Exercise  1.2 Which of the following sequences of characters are atoms, which are variables, which are complex terms, and which are not terms at all? Give the functor and arity of each complex term.
% 
% loves(Vincent,mia)                Complex term; loves/2
% 'loves(Vincent,mia)'              Atom
% Butch(boxer)                      Not a term
% boxer(Butch)                      Complex term; boxer/1
% and(big(burger),kahuna(burger))   Complex term; and/2 
% and(big(X),kahuna(X))             Complex term; and/2
% _and(big(X),kahuna(X))            Not a term
% (Butch  kills  Vincent)           Not a term
% kills(Butch  Vincent)             Not a term
% kills(Butch,Vincent               Not a term

% Exercise  1.3 How many facts, rules, clauses, and predicates are there in the following knowledge base? What are the heads of the rules, and what are the goals they contain?
% 
%    woman(vincent). 
%    woman(mia). 
%    man(jules). 
%    person(X):-  man(X);  woman(X). 
%    loves(X,Y):-  father(X,Y). 
%    father(Y,Z):-  man(Y),  son(Z,Y). 
%    father(Y,Z):-  man(Y),  daughter(Z,Y).
%
% Fact count:  3
% Rule count:  4
% Clause count:  7
% Predicate count:  7
%
% Heads         | Goals (Comma is a separator, not conjunction)
% --------------|----------------------------------------------
% person(X)     | man(X), woman(X)
% loves(X,Y)    | father(X,Y)
% father(Y,Z)   | man(Y),  son(Z,Y), daughter(Z,Y)

% Exercise  1.4 Represent the following in Prolog:
% 
% What to represent                                       | Representation
% --------------------------------------------------------|---------------------------------------------
% Butch is a killer.                                      | killer(butch).
% Mia and Marsellus are married.                          | married(mia, marsellus).
% Zed is dead.                                            | dead(zed).
% Marsellus kills everyone who gives Mia a footmassage.   | kills(marsellus, X) :- footMassage(mia, X).
% Mia loves everyone who is a good dancer.                | loves(mia, X) :- goodDancer(X).
% Jules eats anything that is nutritious or tasty.        | eats(jules, X) :- nutritious(X); tasty(X).

% Exercise  1.5 Suppose we are working with the following knowledge base:
%
%   wizard(ron). 
%   hasWand(harry). 
%   quidditchPlayer(harry). 
%   wizard(X):-  hasBroom(X),  hasWand(X). 
%   hasBroom(X):-  quidditchPlayer(X).
% How does Prolog respond to the following queries?
% Query               | Response
% --------------------|-----------------
% wizard(ron).        | true
% witch(ron).         | Undefined procedure
% wizard(hermione).   | false
% witch(hermione).    | false
% wizard(harry).      | true
% wizard(Y).          | Y = ron; Y = harry.
% witch(Y).           | Undefined procedure

