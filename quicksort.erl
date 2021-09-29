#!/usr/bin/env escript
%% -*- erlang -*-
%%! -sname quicksort -mnesia debug verbose
main([String]) ->
    try
    IntegerList = lists:map(fun(X) -> erlang:list_to_integer(X) end, string:tokens(String, ",")),
    OrderedList = quicksort(IntegerList),
    print(IntegerList),
    print(OrderedList)
    catch
        Exception:Reason ->
            print(Exception, Reason)
    end;
main(_) ->
    usage().

usage() ->
    io:format("usage: quicksort\n"),
    halt(1).

print(Exception, Reason) ->
    io:format("Exception: " ++ Exception ++ " Reason: " ++ Reason).

print(List) ->
    lists:map(fun (X) -> io:format(" ~p ", [X]) end, List),
    io:format("~n").

quicksort([]) -> [];
quicksort([Pivot|Rest]) ->
    Smaller = [Smaller || Smaller <- Rest, Smaller < Pivot],
    Larger = [Larger || Larger <- Rest, Larger >= Pivot],
    quicksort(Smaller) ++ [Pivot] ++ quicksort(Larger).