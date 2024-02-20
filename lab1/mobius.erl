-module(mobius).

-export([is_prime/1, prime_factors/1, is_square_multiple/1,find_square_multiples/2 ]).

is_prime(2) -> true;
is_prime(3) -> true;
is_prime(N) when N > 3 -> is_prime_h(N, 2).
is_prime_h(N,Div) when N rem Div == 0 -> false;
is_prime_h(N,Div) when Div * Div > N -> true;
is_prime_h(N,Div) -> is_prime_h(N,Div+1).

prime_factors(N) -> prime_fa(N,2,[]).
prime_fa(1,_,List) -> List; 
prime_fa(N, Div, List) -> 
    case N rem Div of
        0 -> prime_fa(N div Div, Div, [Div|List]);
        _ -> prime_fa(N, Div + 1, List) 
    end.

is_square_multiple(N) -> sq_help(N,2). 
sq_help(N, Div) when Div * Div > N -> false;
sq_help(N, Div) -> case is_prime(Div) of
    true -> case N rem (Div * Div) of
        0 -> true;
        _ -> sq_help(N, Div+1)
        end;
    false -> sq_help(N, Div+1)
    end.

find_square_multiples(Count, MaxN) ->
    fsm(Count, MaxN, []).

fsm(Count, ToTest, Found) when erlang:length(Found) == Count  -> ToTest+1;
fsm(_, 2, _) -> fail; 
fsm(Count, ToTest, Found) ->
    case is_square_multiple(ToTest) of 
        true -> NewFound = Found ++ [ToTest];
        _ -> NewFound = [] 
    end,
    fsm(Count, ToTest-1, NewFound).






