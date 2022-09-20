permissionset 80000 "JDV ParamHandle Full"
{
    Caption = 'Parameter Handling - Full', MaxLength = 30;
    Assignable = true;

    Permissions =
        codeunit "JDV Parameter - Boolean" = X,
        codeunit "JDV Parameter - Code" = X,
        codeunit "JDV Parameter - Date" = X,
        codeunit "JDV Parameter - DateFormula" = X,
        codeunit "JDV Parameter - DateTime" = X,
        codeunit "JDV Parameter - Decimal" = X,
        codeunit "JDV Parameter - Integer" = X,
        codeunit "JDV Parameter - Switch" = X,
        codeunit "JDV Parameter - Text" = X,
        codeunit "JDV Parameter - Time" = X,
        codeunit "JDV Parameter Handling" = X,
        codeunit "JDV Parameter Handling Impl." = X,
        codeunit "JDV Parameter Factory" = X,
        codeunit "JDV Parameter Mgt. Impl." = X;
}