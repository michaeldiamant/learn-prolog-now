% Exercise  2.1 Which of the following pairs of terms unify? Where relevant, give the variable instantiations that lead to successful unification.
% 
% Term                                           | Does it unify?
% -----------------------------------------------|-----------------------
% bread  =  bread                                | Yes
% 'Bread'  =  bread                              | No
% 'bread'  =  bread                              | Yes
% Bread  =  bread                                | Yes
% bread  =  sausage                              | No
% food(bread)  =  bread                          | No
% food(bread)  =  X                              | Yes
% food(X)  =  food(bread)                        | Yes, bread = X
% food(bread,X)  =  food(Y,sausage)              | Yes
% food(bread,X,beer)  =  food(Y,sausage,X)       | No
% food(bread,X,beer)  =  food(Y,kahuna_burger)   | No
% food(X)  =  X                                  | Yes
% meal(food(bread),drink(beer))  =  meal(X,Y)    | Yes, X = food(bread), Y = drink(beer)
% meal(food(bread),X)  =  meal(X,drink(beer))    | No

% Exercise  2.2 We are working with the following knowledge base:
% 
%    house_elf(dobby). 
%    witch(hermione). 
%    witch('McGonagall'). 
%    witch(rita_skeeter). 
%    magic(X):-  house_elf(X). 
%    magic(X):-  wizard(X). 
%    magic(X):-  witch(X).
% Which of the following queries are satisfied? Where relevant, give all the variable instantiations that lead to success.
% 
% Query                      | Is satisfied?
% ---------------------------|---------------------------------------------------
% ?-  magic(house_elf).      | No
% ?-  wizard(harry).         | No
% ?-  magic(wizard).         | No
% ?-  magic('McGonagall').   | Yes; X = _G34, _G34 = 'McGonagall'
% ?-  magic(Hermione).       | Yes, Herimone = _G34, _G34 = dobby, _G34 = herimone, _G34 = 'McGonagall', _G34 = rita_skeeter
%
% Draw the search tree for the query magic(Hermione) .
%                       ----------------------------------------------------------------------------
%                       |                            ?- magic(Hermione)                            |
%                       ----------------------------------------------------------------------------
%      Hermione = _G34    |                    |                                          |
%            ----------------------    -------------------    ----------------------------------------------------------------
%            | ?- house_elf(_G34) |    | ?- wizard(_G34) |    |                     ?- witch(_G34)                           |
%            ----------------------    -------------------    ----------------------------------------------------------------
%      _G34 = dobby     |                      |   _G34 = herimone |  _G34 = 'McGonagall' |     _G34 = rita_skeeter  |
%                   --------                   X              --------                 --------                   --------
%                   |      |                                  |      |                 |      |                   |       |
%                   --------                                  --------                 --------                   --------
%

% Exercise  2.3 Here is a tiny lexicon (that is, information about individual words) and a mini grammar consisting of one syntactic rule (which defines a sentence to be an entity consisting of five words in the following order: a determiner, a noun, a verb, a determiner, a noun).
% 
%    word(determiner,a). 
%    word(determiner,every). 
%    word(noun,criminal). 
%    word(noun,'big  kahuna  burger'). 
%    word(verb,eats). 
%    word(verb,likes). 
%  
%    sentence(Word1,Word2,Word3,Word4,Word5):- 
%          word(determiner,Word1), 
%          word(noun,Word2), 
%          word(verb,Word3), 
%          word(determiner,Word4), 
%          word(noun,Word5).
% What query do you have to pose in order to find out which sentences the grammar can generate? List all sentences that this grammar can generate in the order that Prolog will generate them in.
% 
%  ?- sentence(A, B, C, D, E).
% A = a, B = criminal, C = eats, D = a, E = criminal;
% A = a, B = criminal, C = eats, D = a, E = 'big kahuna burger';
% A = a, B = criminal, C = eats, D = every, E = criminal;
% A = a, B = criminal, C = eats, D = every, E = 'big kahuna burger';
% A = a, B = criminal, C = likes, D = a, E = criminal;
% A = a, B = criminal, C = likes, D = a, E = 'big kahuna burger';
% A = a, B = criminal, C = likes, D = every, E = criminal;
% A = a, B = criminal, C = likes, D = every, E = 'big kahuna burger';
% A = a, B = 'big kahuna burger', C = eats, D = a, E = criminal;
% A = a, B = 'big kahuna burger', C = eats, D = a, E = 'big kahuna burger';
% A = a, B = 'big kahuna burger', C = eats, D = every, E = criminal;
% A = a, B = 'big kahuna burger', C = eats, D = every, E = 'big kahuna burger';
% A = a, B = 'big kahuna burger', C = likes, D = a, E = criminal;
% A = a, B = 'big kahuna burger', C = likes, D = a, E = 'big kahuna burger';
% A = a, B = 'big kahuna burger', C = likes, D = every, E = criminal;
% A = a, B = 'big kahuna burger', C = likes, D = every, E = 'big kahuna burger';
% A = every, B = criminal, C = eats, D = a, E = criminal;
% A = every, B = criminal, C = eats, D = a, E = 'big kahuna burger';
% A = every, B = criminal, C = eats, D = every, E = criminal;
% A = every, B = criminal, C = eats, D = every, E = 'big kahuna burger';
% A = every, B = criminal, C = likes, D = a, E = criminal;
% A = every, B = criminal, C = likes, D = a, E = 'big kahuna burger';
% A = every, B = criminal, C = likes, D = every, E = criminal;
% A = every, B = criminal, C = likes, D = every, E = 'big kahuna burger';
% A = every, B = 'big kahuna burger', C = eats, D = a, E = criminal;
% A = every, B = 'big kahuna burger', C = eats, D = a, E = 'big kahuna burger';
% A = every, B = 'big kahuna burger', C = eats, D = every, E = criminal;
% A = every, B = 'big kahuna burger', C = eats, D = every, E = 'big kahuna burger';
% A = every, B = 'big kahuna burger', C = likes, D = a, E = criminal;
% A = every, B = 'big kahuna burger', C = likes, D = a, E = 'big kahuna burger';
% A = every, B = 'big kahuna burger', C = likes, D = every, E = criminal;
% A = every, B = 'big kahuna burger', C = likes, D = every, E = 'big kahuna burger';

