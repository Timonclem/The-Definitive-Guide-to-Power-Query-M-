// This file contains your Data Connector logic
[Version = "1.0.0"]
section palindromes;

[DataSource.Kind="palindromes", Publish="palindromes.Publish"]
shared palindromes.Contents = (optional message as text) =>
    let
        _message = if (message <> null) then message else "(no message)",
        a = "Hello from palindromes: " & _message
    in
        a;

// Data Source Kind description
palindromes = [
    Authentication = [
        // Key = [],
        // UsernamePassword = [],
        // Windows = [],
        Anonymous = []
    ]
];

// Data Source UI publishing description
palindromes.Publish = [
    Beta = true,
    Category = "Other",
    ButtonText = { Extension.LoadString("ButtonTitle"), Extension.LoadString("ButtonHelp") },
    LearnMoreUrl = "https://powerbi.microsoft.com/",
    SourceImage = palindromes.Icons,
    SourceTypeImage = palindromes.Icons
];

palindromes.Icons = [
    Icon16 = { Extension.Contents("palindromes16.png"), Extension.Contents("palindromes20.png"), Extension.Contents("palindromes24.png"), Extension.Contents("palindromes32.png") },
    Icon32 = { Extension.Contents("palindromes32.png"), Extension.Contents("palindromes40.png"), Extension.Contents("palindromes48.png"), Extension.Contents("palindromes64.png") }
];
