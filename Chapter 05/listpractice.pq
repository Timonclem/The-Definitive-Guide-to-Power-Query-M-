// let
//     //Source = {1, 2} & {4, 5} // list concatenation
//     Source = List.Combine({{1, 2}, {4, 5}})
// in
//     Source

// Using AB-construct
// let
//     lowercaseletters = {"a".."z"},
//     numbers = {"0".."9"},
//     CombinedCharacters = lowercaseletters & numbers,
//     SelectCharacters = Text.Select("inv-1006-!**!-(act)", CombinedCharacters)
// in
//     SelectCharacters

// List Creation
let
    // list concatenation
    Source = {1, 2} & {4, 5},
    ListCombine = List.Combine({{1, 2}, {4, 5}}),
    // Using AB-construct (a..b form)
    lowercaseletters = {"a".."z"},
    numbers = {"0".."9"},
    CombinedCharacters = lowercaseletters & numbers,
    SelectCharacters = Text.Select("inv-1006-!**!-(act)", CombinedCharacters),
    // List Creation
    data = {1, true, #date(2023, 12, 31)},
    random = List.Random(3),
    //table creation trial
    tablesource = #table({"Product", "Size", "Category"},
                        {
                            {"Shoe", "Medium", "Footwear"},
                            {"Hat", "Large", "Clothes"},
                            {"Shirt", "Medium", "Clothes"},
                            {"Belt", "Extra Small", "Accessories"}
                        }),
    abform = {"Y".."a"},
    charactertonumber = Character.ToNumber("a"),
    characterfromnumber = Character.FromNumber(97),
    // List Selection
    ListSelection = List.Range({1, 2, true}, 2),
    selectionfromlist = {10, 20, 30, 40, 50}{0},
    // non-existent index positions
    nonexistindexposition = {10, 20, 30, 40, 50}{5}?,
    // Operations with list
    numbertablesource = #table({"Column1", "Column2", "Column3"},
                        {
                            {5, 20, 12},
                            {26, 8, 10},
                            {14, 20, 90}
                        }),
    maxnumbers = Table.AddColumn(numbertablesource, "Max", each List.Max({[Column1], [Column2], [Column3]})),
    characterselect = Text.Select("ISBN: 978-3-16-148410-0", {"0".."9", "-"})
in
    //tablesource[Product]
    characterselect

