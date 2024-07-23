let
// Table Concatenation
newtable = #table({"ID", "Name", "City"}, {{1, "John Doe", "Texas"}}) &
                #table({"ID", "Name", "Country"}, {{2, "Jane Doe", "USA"}}),
// Accessing table items
RowSelection = newtable{1},
AlternateSelection = newtable{[ID = 1]},
// Accessing table fields
fieldSelect = newtable[ID],
AlternateFieldSelect = Table.Column(newtable, "Name"),
MultiFieldSelect = newtable[[ID], [Name]],
// combining both access methods to drill down to a single value
ItemSelect = newtable[ID]{1},
tablewithtype = #table( type table[ID = Int64.Type, Name = Text.Type, Country = Text.Type],
                        {
                        {1, "Timon Clem", "Nigeria"},
                        {2, "Mark Frills", "USA"}
                        }
                        )
in
    tablewithtype