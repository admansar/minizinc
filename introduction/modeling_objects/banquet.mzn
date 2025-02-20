enum DISH;
int: capacity;
array[DISH] of int: satisf;
array[DISH] of int: size;

array[DISH] of var int: amt;
constraint forall (i in DISH)(amt[i] >= 0);
constraint sum (i in DISH)(size[i] * amt[i]) <= capacity; % returns the sum for all the expresions

solve maximize sum(i in DISH) (satisf[i] * amt[i]);

output ["Amount = ", show(amt), "\n"];
