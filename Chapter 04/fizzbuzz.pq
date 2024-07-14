let
    Source =
        Table.FromList({1..100}, Splitter.SplitByNothing(), {"Numbers"}, ExtraValues.Error),
    AddFizzBuzz = Table.AddColumn(Source, "FizzBuzz", each
        if Number.Mod([Numbers], 3) = 0 and Number.Mod([Numbers], 5) = 0 then "FizzBuzz" else
        if Number.Mod([Numbers], 3) = 0 then "Fizz" else
        if Number.Mod([Numbers], 5) = 0 then "Buzz" else
        [Numbers],
        Any.Type
    )
in
    AddFizzBuzz