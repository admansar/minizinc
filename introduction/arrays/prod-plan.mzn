enum PRODUCT;
array [PRODUCT] of float: profit;

enum RESOURCE;
array[RESOURCE] of float: capacity;

array[PRODUCT, RESOURCE] of float: consumption;

array[PRODUCT] of var int: produce;

constraint forall(p in PRODUCT)(produce[p] >= 0);

constraint forall(r in RESOURCE) (
    sum(p in PRODUCT)(consumption[p, r] * produce[p]) <= capacity[r]
);

solve maximize sum(p in PRODUCT) (profit[p] * produce[p]);

output ["\(p): \(produce[p])\n" | p in PRODUCT];



% 2d array :
%consumption = [
%				| 1.5, 1.0, 1.0, 1.0
%				| 2.0, 0.0, 2.0, 0.0
%				| 1.5, 0.5, 1.0, 1.0
%				| 0.5, 1.0, 0.9, 1.5
%				| 0.1, 2.5, 0.1, 2.5
%				|];
% or
% consumption = array2d(1..4, 1..5,  [1.5, 1.0, 1.0, 1.0
%				 2.0, 0.0, 2.0, 0.0
%				 1.5, 0.5, 1.0, 1.0
%				 0.5, 1.0, 0.9, 1.5
%				 0.1, 2.5, 0.1, 2.5
%				]) with 4 for lines and 5 for columns, we define the demisions first
% in arrays we can generate something like
% [i + j | i, j in 1..4 where i < j] % inline list with where is the condition and | is for
% flatten an array:
%  array[1..20] of int: list = [consumption[i, j] | i in 1..5, j in 1..4];
