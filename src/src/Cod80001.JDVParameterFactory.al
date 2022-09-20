codeunit 80001 "JDV Parameter Factory"
{
    trigger OnRun()
    begin
        Error('Do not run this object.');
    end;

    procedure BooleanParameter(Name: Text) Parameter: Codeunit "JDV Parameter - Boolean"
    var
        JDVParameterMgtImpl: Codeunit "JDV Parameter Mgt. Impl.";
    begin
        exit(JDVParameterMgtImpl.BooleanParameter(Name));
    end;

    procedure BooleanParameter(Name: Text; Required: Boolean) Parameter: Codeunit "JDV Parameter - Boolean"
    var
        JDVParameterMgtImpl: Codeunit "JDV Parameter Mgt. Impl.";
    begin
        exit(JDVParameterMgtImpl.BooleanParameter(Name, Required));
    end;

    procedure CodeParameter(Name: Text; DefaultValue: Code[2048]) Parameter: Codeunit "JDV Parameter - Code"
    var
        JDVParameterMgtImpl: Codeunit "JDV Parameter Mgt. Impl.";
    begin
        exit(JDVParameterMgtImpl.CodeParameter(Name, DefaultValue));
    end;

    procedure CodeParameter(Name: Text; DefaultValue: Code[2048]; Required: Boolean) Parameter: Codeunit "JDV Parameter - Code"
    var
        JDVParameterMgtImpl: Codeunit "JDV Parameter Mgt. Impl.";
    begin
        exit(JDVParameterMgtImpl.CodeParameter(Name, DefaultValue, Required));
    end;

    procedure CodeParameter(Name: Text) Parameter: Codeunit "JDV Parameter - Code"
    var
        JDVParameterMgtImpl: Codeunit "JDV Parameter Mgt. Impl.";
    begin
        exit(JDVParameterMgtImpl.CodeParameter(Name));
    end;

    procedure DateFormulaParameter(Name: Text; DefaultValue: Text) Parameter: Codeunit "JDV Parameter - DateFormula"
    var
        JDVParameterMgtImpl: Codeunit "JDV Parameter Mgt. Impl.";
    begin
        exit(JDVParameterMgtImpl.DateFormulaParameter(Name, DefaultValue));
    end;

    procedure DateFormulaParameter(Name: Text) Parameter: Codeunit "JDV Parameter - DateFormula"
    var
        JDVParameterMgtImpl: Codeunit "JDV Parameter Mgt. Impl.";
    begin
        exit(JDVParameterMgtImpl.DateFormulaParameter(Name));
    end;

    procedure DateFormulaParameter(Name: Text; DefaultValue: Text; Required: Boolean) Parameter: Codeunit "JDV Parameter - DateFormula"
    var
        JDVParameterMgtImpl: Codeunit "JDV Parameter Mgt. Impl.";
    begin
        exit(JDVParameterMgtImpl.DateFormulaParameter(Name, DefaultValue, Required));
    end;

    procedure DateFormulaParameter(Name: Text; Required: Boolean) Parameter: Codeunit "JDV Parameter - DateFormula"
    var
        JDVParameterMgtImpl: Codeunit "JDV Parameter Mgt. Impl.";
    begin
        exit(JDVParameterMgtImpl.DateFormulaParameter(Name, Required));
    end;

    procedure DateParameter(Name: Text) Parameter: Codeunit "JDV Parameter - Date"
    var
        JDVParameterMgtImpl: Codeunit "JDV Parameter Mgt. Impl.";
    begin
        exit(JDVParameterMgtImpl.DateParameter(Name));
    end;

    procedure IntegerParameter(Name: Text; DefaultValue: Integer; Required: Boolean) Parameter: Codeunit "JDV Parameter - Integer"
    var
        JDVParameterMgtImpl: Codeunit "JDV Parameter Mgt. Impl.";
    begin
        exit(JDVParameterMgtImpl.IntegerParameter(Name, DefaultValue, Required));
    end;


    procedure DateParameter(Name: Text; DefaultValue: Date) Parameter: Codeunit "JDV Parameter - Date"
    var
        JDVParameterMgtImpl: Codeunit "JDV Parameter Mgt. Impl.";
    begin
        exit(JDVParameterMgtImpl.DateParameter(Name, DefaultValue));
    end;

    procedure DateParameter(Name: Text; DefaultValue: Date; Required: Boolean) Parameter: Codeunit "JDV Parameter - Date"
    var
        JDVParameterMgtImpl: Codeunit "JDV Parameter Mgt. Impl.";
    begin
        exit(JDVParameterMgtImpl.DateParameter(Name, DefaultValue, Required));
    end;

    procedure DateTimeParameter(Name: Text) Parameter: Codeunit "JDV Parameter - DateTime"
    var
        JDVParameterMgtImpl: Codeunit "JDV Parameter Mgt. Impl.";
    begin
        exit(JDVParameterMgtImpl.DateTimeParameter(Name));
    end;

    procedure DateTimeParameter(Name: Text; Required: Boolean) Parameter: Codeunit "JDV Parameter - DateTime"
    var
        JDVParameterMgtImpl: Codeunit "JDV Parameter Mgt. Impl.";
    begin
        exit(JDVParameterMgtImpl.DateTimeParameter(Name, Required));
    end;

    procedure DecimalParameter(Name: Text) Parameter: Codeunit "JDV Parameter - Decimal"
    var
        JDVParameterMgtImpl: Codeunit "JDV Parameter Mgt. Impl.";
    begin
        exit(JDVParameterMgtImpl.DecimalParameter(Name));
    end;

    procedure DecimalParameter(Name: Text; DefaultValue: Decimal) Parameter: Codeunit "JDV Parameter - Decimal"
    var
        JDVParameterMgtImpl: Codeunit "JDV Parameter Mgt. Impl.";
    begin
        exit(JDVParameterMgtImpl.DecimalParameter(Name, DefaultValue));
    end;

    procedure DecimalParameter(Name: Text; DefaultValue: Decimal; Required: Boolean) Parameter: Codeunit "JDV Parameter - Decimal"
    var
        JDVParameterMgtImpl: Codeunit "JDV Parameter Mgt. Impl.";
    begin
        exit(JDVParameterMgtImpl.DecimalParameter(Name, DefaultValue, Required));
    end;

    procedure IntegerParameter(Name: Text) Parameter: Codeunit "JDV Parameter - Integer"
    var
        JDVParameterMgtImpl: Codeunit "JDV Parameter Mgt. Impl.";
    begin
        exit(JDVParameterMgtImpl.IntegerParameter(Name));
    end;

    procedure IntegerParameter(Name: Text; Required: Boolean) Parameter: Codeunit "JDV Parameter - Integer"
    var
        JDVParameterMgtImpl: Codeunit "JDV Parameter Mgt. Impl.";
    begin
        exit(JDVParameterMgtImpl.IntegerParameter(Name, Required));
    end;

    procedure Parameter(Name: Text; DefaultValue: Text) Parameter: Codeunit "JDV Parameter - Text"
    var
        JDVParameterMgtImpl: Codeunit "JDV Parameter Mgt. Impl.";
    begin
        exit(JDVParameterMgtImpl.Parameter(Name, DefaultValue));
    end;

    procedure Parameter(Name: Text; DefaultValue: Code[2048]) Parameter: Codeunit "JDV Parameter - Code"
    var
        JDVParameterMgtImpl: Codeunit "JDV Parameter Mgt. Impl.";
    begin
        exit(JDVParameterMgtImpl.Parameter(Name, DefaultValue));
    end;

    procedure Parameter(Name: Text; DefaultValue: Boolean) Parameter: Codeunit "JDV Parameter - Boolean"
    var
        JDVParameterMgtImpl: Codeunit "JDV Parameter Mgt. Impl.";
    begin
        exit(JDVParameterMgtImpl.Parameter(Name, DefaultValue));
    end;

    procedure Parameter(Name: Text; DefaultValue: Integer) Parameter: Codeunit "JDV Parameter - Integer"
    var
        JDVParameterMgtImpl: Codeunit "JDV Parameter Mgt. Impl.";
    begin
        exit(JDVParameterMgtImpl.Parameter(Name, DefaultValue));
    end;

    procedure Parameter(Name: Text; DefaultValue: DateTime) Parameter: Codeunit "JDV Parameter - DateTime"
    var
        JDVParameterMgtImpl: Codeunit "JDV Parameter Mgt. Impl.";
    begin
        exit(JDVParameterMgtImpl.Parameter(Name, DefaultValue));
    end;

    procedure Parameter(Name: Text; DefaultValue: DateFormula) Parameter: Codeunit "JDV Parameter - DateFormula"
    var
        JDVParameterMgtImpl: Codeunit "JDV Parameter Mgt. Impl.";
    begin
        exit(JDVParameterMgtImpl.Parameter(Name, DefaultValue));
    end;

    procedure Parameter(Name: Text; DefaultValue: Decimal) Parameter: Codeunit "JDV Parameter - Decimal"
    var
        JDVParameterMgtImpl: Codeunit "JDV Parameter Mgt. Impl.";
    begin
        exit(JDVParameterMgtImpl.Parameter(Name, DefaultValue));
    end;

    procedure Parameter(Name: Text; DefaultValue: Date) Parameter: Codeunit "JDV Parameter - Date"
    var
        JDVParameterMgtImpl: Codeunit "JDV Parameter Mgt. Impl.";
    begin
        exit(JDVParameterMgtImpl.Parameter(Name, DefaultValue));
    end;

    procedure Parameter(Name: Text; DefaultValue: Time) Parameter: Codeunit "JDV Parameter - Time"
    var
        JDVParameterMgtImpl: Codeunit "JDV Parameter Mgt. Impl.";
    begin
        exit(JDVParameterMgtImpl.Parameter(Name, DefaultValue));
    end;

    procedure Parameter(Name: Text; DefaultValue: Text; Required: Boolean) Parameter: Codeunit "JDV Parameter - Text"
    var
        JDVParameterMgtImpl: Codeunit "JDV Parameter Mgt. Impl.";
    begin
        exit(JDVParameterMgtImpl.Parameter(Name, DefaultValue, Required));
    end;

    procedure Parameter(Name: Text; DefaultValue: Code[2048]; Required: Boolean) Parameter: Codeunit "JDV Parameter - Code"
    var
        JDVParameterMgtImpl: Codeunit "JDV Parameter Mgt. Impl.";
    begin
        exit(JDVParameterMgtImpl.Parameter(Name, DefaultValue, Required));
    end;

    procedure Parameter(Name: Text; DefaultValue: Boolean; Required: Boolean) Parameter: Codeunit "JDV Parameter - Boolean"
    var
        JDVParameterMgtImpl: Codeunit "JDV Parameter Mgt. Impl.";
    begin
        exit(JDVParameterMgtImpl.Parameter(Name, DefaultValue, Required));
    end;

    procedure Parameter(Name: Text; DefaultValue: Integer; Required: Boolean) Parameter: Codeunit "JDV Parameter - Integer"
    var
        JDVParameterMgtImpl: Codeunit "JDV Parameter Mgt. Impl.";
    begin
        exit(JDVParameterMgtImpl.Parameter(Name, DefaultValue, Required));
    end;

    procedure Parameter(Name: Text; DefaultValue: DateTime; Required: Boolean) Parameter: Codeunit "JDV Parameter - DateTime"
    var
        JDVParameterMgtImpl: Codeunit "JDV Parameter Mgt. Impl.";
    begin
        exit(JDVParameterMgtImpl.Parameter(Name, DefaultValue, Required));
    end;

    procedure Parameter(Name: Text; DefaultValue: DateFormula; Required: Boolean) Parameter: Codeunit "JDV Parameter - DateFormula"
    var
        JDVParameterMgtImpl: Codeunit "JDV Parameter Mgt. Impl.";
    begin
        exit(JDVParameterMgtImpl.Parameter(Name, DefaultValue, Required));
    end;

    procedure Parameter(Name: Text; DefaultValue: Decimal; Required: Boolean) Parameter: Codeunit "JDV Parameter - Decimal"
    var
        JDVParameterMgtImpl: Codeunit "JDV Parameter Mgt. Impl.";
    begin
        exit(JDVParameterMgtImpl.Parameter(Name, DefaultValue, Required));
    end;

    procedure Parameter(Name: Text; DefaultValue: Date; Required: Boolean) Parameter: Codeunit "JDV Parameter - Date"
    var
        JDVParameterMgtImpl: Codeunit "JDV Parameter Mgt. Impl.";
    begin
        exit(JDVParameterMgtImpl.Parameter(Name, DefaultValue, Required));
    end;

    procedure Parameter(Name: Text; DefaultValue: Time; Required: Boolean) Parameter: Codeunit "JDV Parameter - Time"
    var
        JDVParameterMgtImpl: Codeunit "JDV Parameter Mgt. Impl.";
    begin
        exit(JDVParameterMgtImpl.Parameter(Name, DefaultValue, Required));
    end;

    procedure SwitchParameter(Name: Text) Parameter: Codeunit "JDV Parameter - Switch"
    var
        JDVParameterMgtImpl: Codeunit "JDV Parameter Mgt. Impl.";
    begin
        exit(JDVParameterMgtImpl.SwitchParameter(Name));
    end;

    procedure SwitchParameter(Name: Text; Required: Boolean) Parameter: Codeunit "JDV Parameter - Switch"
    var
        JDVParameterMgtImpl: Codeunit "JDV Parameter Mgt. Impl.";
    begin
        exit(JDVParameterMgtImpl.SwitchParameter(Name, Required));
    end;

    procedure TextParameter(Name: Text; DefaultValue: Text) Parameter: Codeunit "JDV Parameter - Text"
    var
        JDVParameterMgtImpl: Codeunit "JDV Parameter Mgt. Impl.";
    begin
        exit(JDVParameterMgtImpl.TextParameter(Name, DefaultValue));
    end;

    procedure TextParameter(Name: Text) Parameter: Codeunit "JDV Parameter - Text"
    var
        JDVParameterMgtImpl: Codeunit "JDV Parameter Mgt. Impl.";
    begin
        exit(JDVParameterMgtImpl.TextParameter(Name));
    end;

    procedure TextParameter(Name: Text; DefaultValue: Text; Required: Boolean) Parameter: Codeunit "JDV Parameter - Text"
    var
        JDVParameterMgtImpl: Codeunit "JDV Parameter Mgt. Impl.";
    begin
        exit(JDVParameterMgtImpl.TextParameter(Name, DefaultValue, Required));
    end;

    procedure TextParameter(Name: Text; Required: Boolean) Parameter: Codeunit "JDV Parameter - Text"
    var
        JDVParameterMgtImpl: Codeunit "JDV Parameter Mgt. Impl.";
    begin
        exit(JDVParameterMgtImpl.TextParameter(Name, Required));
    end;

    procedure TimeParameter(Name: Text) Parameter: Codeunit "JDV Parameter - Time"
    var
        JDVParameterMgtImpl: Codeunit "JDV Parameter Mgt. Impl.";
    begin
        exit(JDVParameterMgtImpl.TimeParameter(Name));
    end;

    procedure TimeParameter(Name: Text; DefaultValue: Time) Parameter: Codeunit "JDV Parameter - Time"
    var
        JDVParameterMgtImpl: Codeunit "JDV Parameter Mgt. Impl.";
    begin
        exit(JDVParameterMgtImpl.TimeParameter(Name, DefaultValue));
    end;

    procedure TimeParameter(Name: Text; DefaultValue: Time; Required: Boolean) Parameter: Codeunit "JDV Parameter - Time"
    var
        JDVParameterMgtImpl: Codeunit "JDV Parameter Mgt. Impl.";
    begin
        exit(JDVParameterMgtImpl.TimeParameter(Name, DefaultValue, Required));
    end;
}
