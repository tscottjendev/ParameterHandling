permissionset 90000 "JDV ParamHandle Test"
{
    Caption = 'Parametering Handling - Test', MaxLength = 30;
    Assignable = true;
    Permissions =
        codeunit "JDV Parameters UT" = X;
}