
& ".\Kata Args ATDD.ps1" `
    | ConvertTo-ALTestCodeunit `
        -CodeunitID 50102 `
        -CodeunitName "JDV Kata Args UT" `
        -InitializeFunction `
        -GivenFunctionName "Create {0}" `
        -ThenFunctionName "Verify {0}" `
        | Out-File '..\JDVJobQueueEntryParamKataTest.Codeunit.al'