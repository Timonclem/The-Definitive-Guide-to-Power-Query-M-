let
    StartDate = #date(2024, 5, 1),
    EndDate = #date(2024, 5, 31),
    DateList = List.Transform({Number.From(StartDate)..Number.From(EndDate)}, each Date.From(_)),
    DateTable = Table.FromList(DateList, Splitter.SplitByNothing(), {"Date"}, ExtraValues.Error)
in
    DateTable