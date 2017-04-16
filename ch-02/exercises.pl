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


