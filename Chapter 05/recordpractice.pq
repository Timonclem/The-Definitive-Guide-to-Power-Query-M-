let
    recordone = [Name = "John Doe", Age = 30, City = "Seattle"],
    recordtwo =
                [
                    Full Name = "Mark Daniels",
                    Ages = {20, 30, 40},
                    Name = [Initials = "J", Last Name = "Daniels"]
                ],
    fieldcount = Record.FieldCount(recordtwo),
    recordfieldname = Record.FieldNames(recordtwo),
    // Record Equality (order does not matter)
    RecordList =
        {
            [ID = 1, Product = "Widget"],
            [Product = "Widget", ID = 1],
            [ID = 1, Product = "Widget"]
        },
    UniqueRecords = List.Distinct(RecordList),
    CountRecords = List.Count( UniqueRecords ),
    // Not equal
    EqualityCheck = [Name = "John", Age = 32] <> [Name = "Jane", Age = 32],
    // Concatenation
    RecordConcate1 = [Name = "John", Age = 32] & [Gender = "Male"],
    RecordConcate2 = [Name = "John", Age = 32] & [Age = 45],
    RecordConcate3 = Record.Combine(
        {
            [Name = "John", Age = 32],
            [Age = 44]
        }
    ),
    // Record Creation
    CreateRecord =
        Record.FromList(
            {"John Doe", 30, "Seattle"},
            {"Name", "Age", "City"}
        ),
    // Retrieving a record by referencing a table row
    numbertablesource = #table({"Column1", "Column2", "Column3"},
                        {
                            {5, 20, 12},
                            {26, 8, 10},
                            {14, 20, 90}
                        }),
    rowselection = numbertablesource{0},
    addcolumn = Table.AddColumn( numbertablesource, "New Row", each _ ),
    // Field Selection
    nameselect = Record.Field(CreateRecord, "City"),
    anotherselect = [Info = [Age = 20, Gender = "Male"]][Info][Gender],
    // Field selection with error handling
    anotherselect2 = [Name = "Tony", Age = 30][City]?,
    // or
    anotherselect3 = Record.FieldOrDefault( [Name = "Tony", Age = 30], "City", null),
    multipleselection = [Ab=1,Bo=2,Ed=3][[Ab],[Ed]],
    // selection with error-handling
    multipleselections = [Ab=1,Bo=2,Ed=3][[Ab],[Z]]?,
    multipleselection1 = Record.SelectFields([Ab=1,Bo=2,Ed=3], {"Ab", "B"}, MissingField.UseNull ),
    // Operations with records
    anothertable1 = Table.FromRecords(
        Record.FromTable(numbertablesource ) & Record.FromList({"Denver", "Seattle", "New York"}, "Store")
    ),
    // Providing options for functions
    USDate = Date.ToText( #date(2023, 12, 31), 
                [Format = "dd MMM yyyy", Culture = "en-US"]),
    GermanDate = Date.ToText( #date(2023, 12, 31), 
                [Format = "dd MMM yyyy", Culture = "de-DE"])
in
    GermanDate