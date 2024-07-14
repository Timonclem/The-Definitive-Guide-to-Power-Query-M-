let
    source = 
        #table(
            type table[Word = Text.Type],
            {
                {"bizarre"}, {"racecar"}, {"deified"}, {"probabl"}, {"rotator"}
            }
        ),
        AddCheckPalindrome =
            Table.AddColumn(source, "CheckPalindrome", each
            let
                Letters = Text.ToList( Text.Lower( [Word])),
                Reversed = List.Reverse( Letters ),
                Palindrome = if Letters <> Reversed then false else true
            in
                Palindrome ),
        FilterResult = Table.SelectRows(AddCheckPalindrome, each [CheckPalindrome] = true),
        SortPalindromes = Table.Sort(FilterResult, {"Word", Order.Ascending})
in
    SortPalindromes