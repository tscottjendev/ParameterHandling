codeunit 80001 "JDV Parameter Factory"
{
    trigger OnRun()
    begin
        Error('Do not run this object.');
    end;

    procedure BooleanParameter(Name: Text) Parameter: Codeunit "JDV Parameter - Boolean"
    var
        JDVParameterFactoryImpl: Codeunit "JDV Parameter Factory Impl.";
    begin
        exit(JDVParameterFactoryImpl.BooleanParameter(Name));
    end;

    procedure BooleanParameter(Name: Text; Required: Boolean) Parameter: Codeunit "JDV Parameter - Boolean"
    var
        JDVParameterFactoryImpl: Codeunit "JDV Parameter Factory Impl.";
    begin
        exit(JDVParameterFactoryImpl.BooleanParameter(Name, Required));
    end;

    procedure CodeParameter(Name: Text; DefaultValue: Code[2048]) Parameter: Codeunit "JDV Parameter - Code"
    var
        JDVParameterFactoryImpl: Codeunit "JDV Parameter Factory Impl.";
    begin
        exit(JDVParameterFactoryImpl.CodeParameter(Name, DefaultValue));
    end;

    procedure CodeParameter(Name: Text; DefaultValue: Code[2048]; Required: Boolean) Parameter: Codeunit "JDV Parameter - Code"
    var
        JDVParameterFactoryImpl: Codeunit "JDV Parameter Factory Impl.";
    begin
        exit(JDVParameterFactoryImpl.CodeParameter(Name, DefaultValue, Required));
    end;

    procedure CodeParameter(Name: Text) Parameter: Codeunit "JDV Parameter - Code"
    var
        JDVParameterFactoryImpl: Codeunit "JDV Parameter Factory Impl.";
    begin
        exit(JDVParameterFactoryImpl.CodeParameter(Name));
    end;

    procedure DateFormulaParameter(Name: Text; DefaultValue: Text) Parameter: Codeunit "JDV Parameter - DateFormula"
    var
        JDVParameterFactoryImpl: Codeunit "JDV Parameter Factory Impl.";
    begin
        exit(JDVParameterFactoryImpl.DateFormulaParameter(Name, DefaultValue));
    end;

    procedure DateFormulaParameter(Name: Text) Parameter: Codeunit "JDV Parameter - DateFormula"
    var
        JDVParameterFactoryImpl: Codeunit "JDV Parameter Factory Impl.";
    begin
        exit(JDVParameterFactoryImpl.DateFormulaParameter(Name));
    end;

    procedure DateFormulaParameter(Name: Text; DefaultValue: Text; Required: Boolean) Parameter: Codeunit "JDV Parameter - DateFormula"
    var
        JDVParameterFactoryImpl: Codeunit "JDV Parameter Factory Impl.";
    begin
        exit(JDVParameterFactoryImpl.DateFormulaParameter(Name, DefaultValue, Required));
    end;

    procedure DateFormulaParameter(Name: Text; Required: Boolean) Parameter: Codeunit "JDV Parameter - DateFormula"
    var
        JDVParameterFactoryImpl: Codeunit "JDV Parameter Factory Impl.";
    begin
        exit(JDVParameterFactoryImpl.DateFormulaParameter(Name, Required));
    end;

    procedure DateParameter(Name: Text) Parameter: Codeunit "JDV Parameter - Date"
    var
        JDVParameterFactoryImpl: Codeunit "JDV Parameter Factory Impl.";
    begin
        exit(JDVParameterFactoryImpl.DateParameter(Name));
    end;


    procedure DateParameter(Name: Text; DefaultValue: Date) Parameter: Codeunit "JDV Parameter - Date"
    var
        JDVParameterFactoryImpl: Codeunit "JDV Parameter Factory Impl.";
    begin
        exit(JDVParameterFactoryImpl.DateParameter(Name, DefaultValue));
    end;

    procedure DateParameter(Name: Text; DefaultValue: Date; Required: Boolean) Parameter: Codeunit "JDV Parameter - Date"
    var
        JDVParameterFactoryImpl: Codeunit "JDV Parameter Factory Impl.";
    begin
        exit(JDVParameterFactoryImpl.DateParameter(Name, DefaultValue, Required));
    end;

    procedure DateTimeParameter(Name: Text) Parameter: Codeunit "JDV Parameter - DateTime"
    var
        JDVParameterFactoryImpl: Codeunit "JDV Parameter Factory Impl.";
    begin
        exit(JDVParameterFactoryImpl.DateTimeParameter(Name));
    end;

    procedure DateTimeParameter(Name: Text; Required: Boolean) Parameter: Codeunit "JDV Parameter - DateTime"
    var
        JDVParameterFactoryImpl: Codeunit "JDV Parameter Factory Impl.";
    begin
        exit(JDVParameterFactoryImpl.DateTimeParameter(Name, Required));
    end;

    procedure DecimalParameter(Name: Text) Parameter: Codeunit "JDV Parameter - Decimal"
    var
        JDVParameterFactoryImpl: Codeunit "JDV Parameter Factory Impl.";
    begin
        exit(JDVParameterFactoryImpl.DecimalParameter(Name));
    end;

    procedure DecimalParameter(Name: Text; DefaultValue: Decimal) Parameter: Codeunit "JDV Parameter - Decimal"
    var
        JDVParameterFactoryImpl: Codeunit "JDV Parameter Factory Impl.";
    begin
        exit(JDVParameterFactoryImpl.DecimalParameter(Name, DefaultValue));
    end;

    procedure DecimalParameter(Name: Text; DefaultValue: Decimal; Required: Boolean) Parameter: Codeunit "JDV Parameter - Decimal"
    var
        JDVParameterFactoryImpl: Codeunit "JDV Parameter Factory Impl.";
    begin
        exit(JDVParameterFactoryImpl.DecimalParameter(Name, DefaultValue, Required));
    end;

    procedure IntegerParameter(Name: Text; DefaultValue: Integer; Required: Boolean) Parameter: Codeunit "JDV Parameter - Integer"
    var
        JDVParameterFactoryImpl: Codeunit "JDV Parameter Factory Impl.";
    begin
        exit(JDVParameterFactoryImpl.IntegerParameter(Name, DefaultValue, Required));
    end;

    procedure IntegerParameter(Name: Text) Parameter: Codeunit "JDV Parameter - Integer"
    var
        JDVParameterFactoryImpl: Codeunit "JDV Parameter Factory Impl.";
    begin
        exit(JDVParameterFactoryImpl.IntegerParameter(Name));
    end;

    procedure IntegerParameter(Name: Text; Required: Boolean) Parameter: Codeunit "JDV Parameter - Integer"
    var
        JDVParameterFactoryImpl: Codeunit "JDV Parameter Factory Impl.";
    begin
        exit(JDVParameterFactoryImpl.IntegerParameter(Name, Required));
    end;

    procedure Parameter(Name: Text; DefaultValue: Text) Parameter: Codeunit "JDV Parameter - Text"
    var
        JDVParameterFactoryImpl: Codeunit "JDV Parameter Factory Impl.";
    begin
        exit(JDVParameterFactoryImpl.Parameter(Name, DefaultValue));
    end;

    procedure Parameter(Name: Text; DefaultValue: Code[2048]) Parameter: Codeunit "JDV Parameter - Code"
    var
        JDVParameterFactoryImpl: Codeunit "JDV Parameter Factory Impl.";
    begin
        exit(JDVParameterFactoryImpl.Parameter(Name, DefaultValue));
    end;

    procedure Parameter(Name: Text; DefaultValue: Boolean) Parameter: Codeunit "JDV Parameter - Boolean"
    var
        JDVParameterFactoryImpl: Codeunit "JDV Parameter Factory Impl.";
    begin
        exit(JDVParameterFactoryImpl.Parameter(Name, DefaultValue));
    end;

    procedure Parameter(Name: Text; DefaultValue: Integer) Parameter: Codeunit "JDV Parameter - Integer"
    var
        JDVParameterFactoryImpl: Codeunit "JDV Parameter Factory Impl.";
    begin
        exit(JDVParameterFactoryImpl.Parameter(Name, DefaultValue));
    end;

    procedure Parameter(Name: Text; DefaultValue: DateTime) Parameter: Codeunit "JDV Parameter - DateTime"
    var
        JDVParameterFactoryImpl: Codeunit "JDV Parameter Factory Impl.";
    begin
        exit(JDVParameterFactoryImpl.Parameter(Name, DefaultValue));
    end;

    procedure Parameter(Name: Text; DefaultValue: DateFormula) Parameter: Codeunit "JDV Parameter - DateFormula"
    var
        JDVParameterFactoryImpl: Codeunit "JDV Parameter Factory Impl.";
    begin
        exit(JDVParameterFactoryImpl.Parameter(Name, DefaultValue));
    end;

    procedure Parameter(Name: Text; DefaultValue: Decimal) Parameter: Codeunit "JDV Parameter - Decimal"
    var
        JDVParameterFactoryImpl: Codeunit "JDV Parameter Factory Impl.";
    begin
        exit(JDVParameterFactoryImpl.Parameter(Name, DefaultValue));
    end;

    procedure Parameter(Name: Text; DefaultValue: Date) Parameter: Codeunit "JDV Parameter - Date"
    var
        JDVParameterFactoryImpl: Codeunit "JDV Parameter Factory Impl.";
    begin
        exit(JDVParameterFactoryImpl.Parameter(Name, DefaultValue));
    end;

    procedure Parameter(Name: Text; DefaultValue: Time) Parameter: Codeunit "JDV Parameter - Time"
    var
        JDVParameterFactoryImpl: Codeunit "JDV Parameter Factory Impl.";
    begin
        exit(JDVParameterFactoryImpl.Parameter(Name, DefaultValue));
    end;

    procedure Parameter(Name: Text; DefaultValue: Text; Required: Boolean) Parameter: Codeunit "JDV Parameter - Text"
    var
        JDVParameterFactoryImpl: Codeunit "JDV Parameter Factory Impl.";
    begin
        exit(JDVParameterFactoryImpl.Parameter(Name, DefaultValue, Required));
    end;

    procedure Parameter(Name: Text; DefaultValue: Code[2048]; Required: Boolean) Parameter: Codeunit "JDV Parameter - Code"
    var
        JDVParameterFactoryImpl: Codeunit "JDV Parameter Factory Impl.";
    begin
        exit(JDVParameterFactoryImpl.Parameter(Name, DefaultValue, Required));
    end;

    procedure Parameter(Name: Text; DefaultValue: Boolean; Required: Boolean) Parameter: Codeunit "JDV Parameter - Boolean"
    var
        JDVParameterFactoryImpl: Codeunit "JDV Parameter Factory Impl.";
    begin
        exit(JDVParameterFactoryImpl.Parameter(Name, DefaultValue, Required));
    end;

    procedure Parameter(Name: Text; DefaultValue: Integer; Required: Boolean) Parameter: Codeunit "JDV Parameter - Integer"
    var
        JDVParameterFactoryImpl: Codeunit "JDV Parameter Factory Impl.";
    begin
        exit(JDVParameterFactoryImpl.Parameter(Name, DefaultValue, Required));
    end;

    procedure Parameter(Name: Text; DefaultValue: DateTime; Required: Boolean) Parameter: Codeunit "JDV Parameter - DateTime"
    var
        JDVParameterFactoryImpl: Codeunit "JDV Parameter Factory Impl.";
    begin
        exit(JDVParameterFactoryImpl.Parameter(Name, DefaultValue, Required));
    end;

    procedure Parameter(Name: Text; DefaultValue: DateFormula; Required: Boolean) Parameter: Codeunit "JDV Parameter - DateFormula"
    var
        JDVParameterFactoryImpl: Codeunit "JDV Parameter Factory Impl.";
    begin
        exit(JDVParameterFactoryImpl.Parameter(Name, DefaultValue, Required));
    end;

    procedure Parameter(Name: Text; DefaultValue: Decimal; Required: Boolean) Parameter: Codeunit "JDV Parameter - Decimal"
    var
        JDVParameterFactoryImpl: Codeunit "JDV Parameter Factory Impl.";
    begin
        exit(JDVParameterFactoryImpl.Parameter(Name, DefaultValue, Required));
    end;

    procedure Parameter(Name: Text; DefaultValue: Date; Required: Boolean) Parameter: Codeunit "JDV Parameter - Date"
    var
        JDVParameterFactoryImpl: Codeunit "JDV Parameter Factory Impl.";
    begin
        exit(JDVParameterFactoryImpl.Parameter(Name, DefaultValue, Required));
    end;

    procedure Parameter(Name: Text; DefaultValue: Time; Required: Boolean) Parameter: Codeunit "JDV Parameter - Time"
    var
        JDVParameterFactoryImpl: Codeunit "JDV Parameter Factory Impl.";
    begin
        exit(JDVParameterFactoryImpl.Parameter(Name, DefaultValue, Required));
    end;

    procedure SwitchParameter(Name: Text) Parameter: Codeunit "JDV Parameter - Switch"
    var
        JDVParameterFactoryImpl: Codeunit "JDV Parameter Factory Impl.";
    begin
        exit(JDVParameterFactoryImpl.SwitchParameter(Name));
    end;

    procedure SwitchParameter(Name: Text; Required: Boolean) Parameter: Codeunit "JDV Parameter - Switch"
    var
        JDVParameterFactoryImpl: Codeunit "JDV Parameter Factory Impl.";
    begin
        exit(JDVParameterFactoryImpl.SwitchParameter(Name, Required));
    end;

    procedure TextParameter(Name: Text; DefaultValue: Text) Parameter: Codeunit "JDV Parameter - Text"
    var
        JDVParameterFactoryImpl: Codeunit "JDV Parameter Factory Impl.";
    begin
        exit(JDVParameterFactoryImpl.TextParameter(Name, DefaultValue));
    end;

    procedure TextParameter(Name: Text) Parameter: Codeunit "JDV Parameter - Text"
    var
        JDVParameterFactoryImpl: Codeunit "JDV Parameter Factory Impl.";
    begin
        exit(JDVParameterFactoryImpl.TextParameter(Name));
    end;

    procedure TextParameter(Name: Text; DefaultValue: Text; Required: Boolean) Parameter: Codeunit "JDV Parameter - Text"
    var
        JDVParameterFactoryImpl: Codeunit "JDV Parameter Factory Impl.";
    begin
        exit(JDVParameterFactoryImpl.TextParameter(Name, DefaultValue, Required));
    end;

    procedure TextParameter(Name: Text; Required: Boolean) Parameter: Codeunit "JDV Parameter - Text"
    var
        JDVParameterFactoryImpl: Codeunit "JDV Parameter Factory Impl.";
    begin
        exit(JDVParameterFactoryImpl.TextParameter(Name, Required));
    end;

    procedure TimeParameter(Name: Text) Parameter: Codeunit "JDV Parameter - Time"
    var
        JDVParameterFactoryImpl: Codeunit "JDV Parameter Factory Impl.";
    begin
        exit(JDVParameterFactoryImpl.TimeParameter(Name));
    end;

    procedure TimeParameter(Name: Text; DefaultValue: Time) Parameter: Codeunit "JDV Parameter - Time"
    var
        JDVParameterFactoryImpl: Codeunit "JDV Parameter Factory Impl.";
    begin
        exit(JDVParameterFactoryImpl.TimeParameter(Name, DefaultValue));
    end;

    procedure TimeParameter(Name: Text; DefaultValue: Time; Required: Boolean) Parameter: Codeunit "JDV Parameter - Time"
    var
        JDVParameterFactoryImpl: Codeunit "JDV Parameter Factory Impl.";
    begin
        exit(JDVParameterFactoryImpl.TimeParameter(Name, DefaultValue, Required));
    end;
}
