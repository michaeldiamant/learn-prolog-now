% Exercise  3.1 In the text, we discussed the predicate
%
%   descend(X,Y)  :-  child(X,Y). 
%   descend(X,Y)  :-  child(X,Z), 
%                                     descend(Z,Y).
% Suppose we reformulated this predicate as follows:
%
%   descend(X,Y)  :-  child(X,Y). 
%   descend(X,Y)  :-  descend(X,Z), 
%                                    descend(Z,Y).
% Would this be problematic?

% Yes, this definition is problematic because there is no base case in the second predicate.  Each goal in the second predicate defines a recursive call to descend that will loop forever.

% Exercise  3.2 Do you know these wooden Russian dolls (Matryoshka dolls) where the smaller ones are contained in bigger ones? Here is a schematic picture:
%
% http://www.learnprolognow.org/html/dolls.eps.png
%
% First, write a knowledge base using the predicate directlyIn/2 which encodes which doll is directly contained in which other doll. Then, define a recursive predicate in/2 , that tells us which doll is (directly or indirectly) contained in which other dolls. For example, the query in(katarina,natasha) should evaluate to true, while in(olga,  katarina) should fail.

directlyIn(katarina, olga).
directlyIn(olga, natasha).
directlyIn(natasha, irina).

in(X, Y) :- directlyIn(X, Y);
            directlyIn(X, Z),
            in(Z, Y).

% Exercise  3.3 We have the following knowledge base:
 
   directTrain(saarbruecken,dudweiler). 
   directTrain(forbach,saarbruecken). 
   directTrain(freyming,forbach). 
   directTrain(stAvold,freyming). 
   directTrain(fahlquemont,stAvold). 
   directTrain(metz,fahlquemont). 
   directTrain(nancy,metz).
% That is, this knowledge base holds facts about towns it is possible to travel between by taking a direct train. But of course, we can travel further by chaining together direct train journeys. Write a recursive predicate travelFromTo/2 that tells us when we can travel by train between two towns. For example, when given the query
%
%   travelFromTo(nancy,saarbruecken).
% it should reply yes.

travelFromTo(X, Y) :- directTrain(X, Y);
            directTrain(X, Z),
            travelFromTo(Z, Y).

% Exercise  3.4 Define a predicate greater_than/2 that takes two numerals in the notation that we introduced in the text (that is, 0, succ(0), succ(succ(0)), and so on) as arguments and decides whether the first one is greater than the second one. For example:
%
%   ?-  greater_than(succ(succ(succ(0))),succ(0)). 
%   yes 
%   ?-  greater_than(succ(succ(0)),succ(succ(succ(0)))). 
%   no

numeral(0). 
numeral(succ(X)) :- numeral(X).

greater_than(succ(_), 0).
greater_than(succ(X), succ(Y)) :- greater_than(X, Y).

% Exercise  3.5 Binary trees are trees where all internal nodes have exactly two children. The smallest binary trees consist of only one leaf node. We will represent leaf nodes as leaf(Label) . For instance, leaf(3) and leaf(7) are leaf nodes, and therefore small binary trees. Given two binary trees B1 and B2 we can combine them into one binary tree using the functor tree/2 as follows: tree(B1,B2) . So, from the leaves leaf(1) and leaf(2) we can build the binary tree tree(leaf(1),leaf(2)) . And from the binary trees tree(leaf(1),leaf(2)) and leaf(4) we can build the binary tree tree(tree(leaf(1),  leaf(2)),leaf(4)) .
%
% Now, define a predicate swap/2 , which produces the mirror image of the binary tree that is its first argument. For example:
%
%   ?-  swap(tree(tree(leaf(1),  leaf(2)),  leaf(4)),T). 
%   T  =  tree(leaf(4),  tree(leaf(2),  leaf(1))). 
%   yes

% It's possible to define a fact that performs the swap as:
%
% swap(tree(A, B), tree(B, A)).
%
% However, this doesn't meet the requirement of a predicate.  As a predicate, it is possible to define:

swap(leaf(X), leaf(X)).
swap(tree(A, B), tree(C, D)) :- swap(A, D), swap(B, C).

% While working on this problem, I spent a lot of time defining the structure of a tree.  Something like:
%
% leaf(_).
% tree(leaf(_)).
% tree(X, Y) :- leaf(X), leaf(Y);
%              tree(X), tree(Y); 
%              leaf(X), tree(Y); 
%              tree(X), leaf(Y).        
%
% This lead me down the road to creating a fact:
%
% swap(tree(A, B), tree(B, A)).
%
% This fact will "work" for swapping trees.  However, it allows illegal swaps like:
%
% [debug]  ?- swap(tree(tree(leaf(1),  tree(leaf(2), leaf(3))),  tree(leaf(4), leafs(6))), T).
% T = tree(tree(leaf(4), leafs(6)), tree(leaf(1), tree(leaf(2), leaf(3)))).
%
% Here, I delibrately used 'leafs'.  The fact I provided allows mirroring to happen even though the tree was formed without a "leaf".  To get to the solution, I had to change my thinking from first focusing on defining the structure of a tree (i.e. tree and leaf relationship) and instead focus on the assertions that can be made (e.g. when two leaf values are equal, then they have been "swapped").

