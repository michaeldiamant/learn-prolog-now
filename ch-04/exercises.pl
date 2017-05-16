% Exercise  4.1 How does Prolog respond to the following queries?
%
% 1. [a,b,c,d]  =  [a,[b,c,d]].
% false
% 2. [a,b,c,d]  =  [a|[b,c,d]].
% true
% 3. [a,b,c,d]  =  [a,b,[c,d]].
% false
% 4. [a,b,c,d]  =  [a,b|[c,d]].
% true
% 5. [a,b,c,d]  =  [a,b,c,[d]].
% false 
% 6. [a,b,c,d]  =  [a,b,c|[d]].
% true 
% 7. [a,b,c,d]  =  [a,b,c,d,[]].
% false
% 8. [a,b,c,d]  =  [a,b,c,d|[]].
% true
% 9. []  =  _.
% true
% 10. []  =  [_].
% false
% 11. []  =  [_|[]].
% false

% Exercise  4.2 Which of the following are syntactically correct lists? If the representation is correct, how many elements does the list have?
%
% 1. [1|[2,3,4]]
% 4
% 2. [1,2,3|[]]
% 3
% 3. [1|2,3,4]
% N/A
% 4. [1|[2|[3|[4]]]]
% 4
% 5. [1,2,3,4|[]]
% 4
% 6. [[]|[]]
% 1
% 7. [[1,2]|4]
% N/A
% 8. [[1,2],[3,4]|[5,6,7]]
% 5

% Exercise  4.3 Write a predicate second(X,List) which checks whether X is the second element of List .
% Expressed as a fact:
second(X, [_, X|_]).
% Expressed as a predicate:
second(X, XS) :- XS = [_, X | _].

% Exercise  4.4 Write a predicate swap12(List1,List2) which checks whether List1 is identical to List2 , except that the first two elements are exchanged.
swap12(XS, YS) :- XS = [A, B | TX ], 
                  YS = [B, A | YX ], 
                  TX = YX.

% Exercise  4.5 Suppose we are given a knowledge base with the following facts:

   tran(eins,one). 
   tran(zwei,two). 
   tran(drei,three). 
   tran(vier,four). 
   tran(fuenf,five). 
   tran(sechs,six). 
   tran(sieben,seven). 
   tran(acht,eight). 
   tran(neun,nine).
%  Write a predicate listtran(G,E) which translates a list of German number words to the corresponding list of English number words. For example:
%
%  listtran([eins,neun,zwei],X).
% should give:
%
%   X  =  [one,nine,two].
% Your program should also work in the other direction. For example, if you give it the query
%
%   listtran(X,[one,seven,six,two]).
% it should return:
%
%   X  =  [eins,sieben,sechs,zwei].
% (Hint: to answer this question, first ask yourself "How do I translate the empty list of number words?". That's the base case. For non-empty lists, first translate the head of the list, then use recursion to translate the tail.)

listtran([], []).
listtran([G|TG],[E|EG]) :- tran(G, E), listtran(TG, EG).

% Exercise  4.6 Write a predicate twice(In,Out) whose left argument is a list, and whose right argument is a list consisting of every element in the left list written twice. For example, the query
%
%   twice([a,4,buggle],X).
% should return
%
%   X  =  [a,a,4,4,buggle,buggle]).
% And the query
%
%   twice([1,2,1,1],X).
% should return
%
%   X  =  [1,1,2,2,1,1,1,1].
% (Hint: to answer this question, first ask yourself "What should happen when the first argument is the empty list?". That's the base case. For non-empty lists, think about what you should do with the head, and use recursion to handle the tail.)

twice([], []).
twice([X|XS], [X, X|YS]) :- twice(XS, YS).

% Exercise  4.7 Draw the search trees for the following three queries:
%
%   ?-  member(a,[c,b,a,y]). 
%     -----------------------------
%    | ?- member(a, [c, b, a, y]) |
%    ------------------------------
%                  |
%    ---------------------------
%    | ?- member(a, [b, a, y]) |
%    ---------------------------
%                  |
%    ------------------------
%    | ?- member(a, [a, y]) |
%    ------------------------
%                  |
%               -------
%               |     |
%               -------    
%
%   ?-  member(x,[a,b,c]). 
%     --------------------------
%    | ?- member(x, [a, b, c]) |
%    ---------------------------
%                  |
%    ------------------------
%    | ?- member(x, [b, c]) |
%    ------------------------
%                  |
%    ---------------------
%    | ?- member(x, [c]) |
%    ---------------------
%                  |
%    ---------------------
%    | ?- member(x, []) |
%    ---------------------
%                  |
%                  X
%    
%   ?-  member(X,[a,b,c]). 
%    ---------------------------
%    | ?- member(X, [a, b, c]) |
%    ---------------------------
%         X = _G5 |
%    -----------------------------
%    | ?- member(_G5, [a, b, c]) |
%    -----------------------------    
%  _G5 = a |            X = _G6 |
%       -------         ---------------------------
%       |     |         | ?- member(_G6, [b, c]) |
%       -------         ---------------------------
%                  _G6 = b |         X = _G7 |
%                       -------      ------------------------
%                       |     |      | ?- member(_G7, [c]) |
%                       -------      ------------------------
%                                  _G7 = c |       X = _G8 |
%                                       --------      ----------------------
%                                       |      |      | ?- member(_G8, []) |
%                                       --------      ----------------------
%                                                               |
%                                                               X
    
