-module(fib).
-export([fib_p/1, fib_g/1, tail_fib/1]).

%% Cравнение аргумента с образцом
fib_p(0) -> 0;
fib_p(1) -> 1;
fib_p(N) ->
if
    true -> fib_p(N - 1) + fib_p(N - 2)
end.

%% Cторожевые последовательности
fib_g(0) -> 0;
fib_g(1) -> 1;
fib_g(N) when N > 1 ->
    fib_g(N - 1) + fib_g(N - 2).


%% Xвостовая рекурсия
tail_fib_helper( 0, Result, _Next) -> Result ;  %% last recursion output
tail_fib_helper( Iter, Result, Next) when Iter > 0 -> tail_fib_helper( Iter -1, Next, Result + Next) .
tail_fib( N) -> tail_fib_helper( N, 0, 1) .