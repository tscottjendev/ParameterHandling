codeunit 80015 "JDV Parameter Factory Impl."
{
    Access = Internal;

    trigger OnRun()
    begin
        Error('Do not run this object.');
    end;

    procedure BooleanParameter(Name: Text) Parameter: Codeunit "JDV Parameter - Boolean"
    begin
        exit(Parameter(Name, false));
    end;

    procedure BooleanParameter(Name: Text; Required: Boolean) Parameter: Codeunit "JDV Parameter - Boolean"
    begin
        exit(Parameter(Name, false, Required));
    end;

    procedure CodeParameter(Name: Text; DefaultValue: Code[2048]) Parameter: Codeunit "JDV Parameter - Code"
    begin
        exit(Parameter(Name, DefaultValue));
    end;

    procedure CodeParameter(Name: Text; DefaultValue: Code[2048]; Required: Boolean) Parameter: Codeunit "JDV Parameter - Code"
    begin
        exit(Parameter(Name, DefaultValue, Required));
    end;

    procedure CodeParameter(Name: Text) Parameter: Codeunit "JDV Parameter - Code"
    begin
        exit(CodeParameter(Name, '', false));
    end;

    procedure DateFormulaParameter(Name: Text; DefaultValue: Text) Parameter: Codeunit "JDV Parameter - DateFormula"
    var
        DateFormulaValue: DateFormula;
    begin
        Evaluate(DateFormulaValue, DefaultValue);
        exit(Parameter(Name, DateFormulaValue));
    end;

    procedure DateFormulaParameter(Name: Text) Parameter: Codeunit "JDV Parameter - DateFormula"
    begin
        exit(DateFormulaParameter(Name, ''));
    end;

    procedure DateFormulaParameter(Name: Text; DefaultValue: Text; Required: Boolean) Parameter: Codeunit "JDV Parameter - DateFormula"
    var
        DateFormulaValue: DateFormula;
    begin
        Evaluate(DateFormulaValue, DefaultValue);
        exit(Parameter(Name, DateFormulaValue, Required));
    end;

    procedure DateFormulaParameter(Name: Text; Required: Boolean) Parameter: Codeunit "JDV Parameter - DateFormula"
    begin
        exit(DateFormulaParameter(Name, '', Required));
    end;

    procedure DateParameter(Name: Text) Parameter: Codeunit "JDV Parameter - Date"
    begin
        exit(Parameter(Name, 0D));
    end;

    procedure DateParameter(Name: Text; DefaultValue: Date) Parameter: Codeunit "JDV Parameter - Date"
    begin
        exit(Parameter(Name, DefaultValue));
    end;

    procedure DateParameter(Name: Text; DefaultValue: Date; Required: Boolean) Parameter: Codeunit "JDV Parameter - Date"
    begin
        exit(Parameter(Name, DefaultValue, Required));
    end;

    procedure DateTimeParameter(Name: Text) Parameter: Codeunit "JDV Parameter - DateTime"
    begin
        exit(Parameter(Name, 0DT));
    end;

    procedure DateTimeParameter(Name: Text; Required: Boolean) Parameter: Codeunit "JDV Parameter - DateTime"
    begin
        exit(Parameter(Name, 0DT, Required));
    end;

    procedure DecimalParameter(Name: Text) Parameter: Codeunit "JDV Parameter - Decimal"
    begin
        exit(Parameter(Name, 0.0));
    end;

    procedure DecimalParameter(Name: Text; DefaultValue: Decimal) Parameter: Codeunit "JDV Parameter - Decimal"
    begin
        exit(Parameter(Name, DefaultValue));
    end;

    procedure DecimalParameter(Name: Text; DefaultValue: Decimal; Required: Boolean) Parameter: Codeunit "JDV Parameter - Decimal"
    begin
        exit(Parameter(Name, DefaultValue, Required));
    end;

    procedure IntegerParameter(Name: Text) Parameter: Codeunit "JDV Parameter - Integer"
    begin
        exit(Parameter(Name, 0));
    end;

    procedure IntegerParameter(Name: Text; Required: Boolean) Parameter: Codeunit "JDV Parameter - Integer"
    begin
        exit(Parameter(Name, 0, Required));
    end;

    procedure IntegerParameter(Name: Text; DefaultValue: Integer; Required: Boolean) Parameter: Codeunit "JDV Parameter - Integer"
    begin
        exit(Parameter(Name, DefaultValue, Required));
    end;

    procedure Parameter(Name: Text; DefaultValue: Text) Parameter: Codeunit "JDV Parameter - Text"
    begin
        exit(Parameter(Name, DefaultValue, false));
    end;

    procedure Parameter(Name: Text; DefaultValue: Code[2048]) Parameter: Codeunit "JDV Parameter - Code"
    begin
        exit(Parameter(Name, DefaultValue, false));
    end;

    procedure Parameter(Name: Text; DefaultValue: Boolean) Parameter: Codeunit "JDV Parameter - Boolean"
    begin
        exit(Parameter(Name, DefaultValue, false));
    end;

    procedure Parameter(Name: Text; DefaultValue: Integer) Parameter: Codeunit "JDV Parameter - Integer"
    begin
        exit(Parameter(Name, DefaultValue, false));
    end;

    procedure Parameter(Name: Text; DefaultValue: DateTime) Parameter: Codeunit "JDV Parameter - DateTime"
    begin
        exit(Parameter(Name, DefaultValue, false));
    end;

    procedure Parameter(Name: Text; DefaultValue: DateFormula) Parameter: Codeunit "JDV Parameter - DateFormula"
    begin
        exit(Parameter(Name, DefaultValue, false));
    end;

    procedure Parameter(Name: Text; DefaultValue: Decimal) Parameter: Codeunit "JDV Parameter - Decimal"
    begin
        exit(Parameter(Name, DefaultValue, false));
    end;

    procedure Parameter(Name: Text; DefaultValue: Date) Parameter: Codeunit "JDV Parameter - Date"
    begin
        exit(Parameter(Name, DefaultValue, false));
    end;

    procedure Parameter(Name: Text; DefaultValue: Time) Parameter: Codeunit "JDV Parameter - Time"
    begin
        exit(Parameter(Name, DefaultValue, false));
    end;

    procedure Parameter(Name: Text; DefaultValue: Text; Required: Boolean) Parameter: Codeunit "JDV Parameter - Text"
    begin
        Parameter.Name(Name);
        Parameter.DefaultValue(DefaultValue);
        Parameter.IsRequired(Required);

        exit(Parameter);
    end;

    procedure Parameter(Name: Text; DefaultValue: Code[2048]; Required: Boolean) Parameter: Codeunit "JDV Parameter - Code"
    begin
        Parameter.Name(Name);
        Parameter.DefaultValue(DefaultValue);
        Parameter.IsRequired(Required);

        exit(Parameter);
    end;

    procedure Parameter(Name: Text; DefaultValue: Boolean; Required: Boolean) Parameter: Codeunit "JDV Parameter - Boolean"
    begin
        Parameter.Name(Name);
        Parameter.DefaultValue(DefaultValue);
        Parameter.IsRequired(Required);

        exit(Parameter);
    end;

    procedure Parameter(Name: Text; DefaultValue: Integer; Required: Boolean) Parameter: Codeunit "JDV Parameter - Integer"
    begin
        Parameter.Name(Name);
        Parameter.DefaultValue(DefaultValue);
        Parameter.IsRequired(Required);

        exit(Parameter);
    end;

    procedure Parameter(Name: Text; DefaultValue: DateTime; Required: Boolean) Parameter: Codeunit "JDV Parameter - DateTime"
    begin
        Parameter.Name(Name);
        Parameter.DefaultValue(DefaultValue);
        Parameter.IsRequired(Required);

        exit(Parameter);
    end;

    procedure Parameter(Name: Text; DefaultValue: DateFormula; Required: Boolean) Parameter: Codeunit "JDV Parameter - DateFormula"
    begin
        Parameter.Name(Name);
        Parameter.DefaultValue(DefaultValue);
        Parameter.IsRequired(Required);

        exit(Parameter);
    end;

    procedure Parameter(Name: Text; DefaultValue: Decimal; Required: Boolean) Parameter: Codeunit "JDV Parameter - Decimal"
    begin
        Parameter.Name(Name);
        Parameter.DefaultValue(DefaultValue);
        Parameter.IsRequired(Required);

        exit(Parameter);
    end;

    procedure Parameter(Name: Text; DefaultValue: Date; Required: Boolean) Parameter: Codeunit "JDV Parameter - Date"
    begin
        Parameter.Name(Name);
        Parameter.DefaultValue(DefaultValue);
        Parameter.IsRequired(Required);

        exit(Parameter);
    end;

    procedure Parameter(Name: Text; DefaultValue: Time; Required: Boolean) Parameter: Codeunit "JDV Parameter - Time"
    begin
        Parameter.Name(Name);
        Parameter.DefaultValue(DefaultValue);
        Parameter.IsRequired(Required);

        exit(Parameter);
    end;

    procedure SwitchParameter(Name: Text) Parameter: Codeunit "JDV Parameter - Switch"
    begin
        exit(SwitchParameter(Name, false));
    end;

    procedure SwitchParameter(Name: Text; Required: Boolean) Parameter: Codeunit "JDV Parameter - Switch"
    begin
        exit(SwitchParameter(Name, false, Required));
    end;

    procedure SwitchParameter(Name: Text; DefaultValue: Boolean; Required: Boolean) Parameter: Codeunit "JDV Parameter - Switch"
    begin
        Parameter.Name(Name);
        Parameter.DefaultValue(false);
        Parameter.IsRequired(Required);
        exit(Parameter);
    end;

    procedure TextParameter(Name: Text; DefaultValue: Text) Parameter: Codeunit "JDV Parameter - Text"
    begin
        exit(Parameter(Name, DefaultValue));
    end;

    procedure TextParameter(Name: Text) Parameter: Codeunit "JDV Parameter - Text"
    begin
        exit(TextParameter(Name, ''));
    end;

    procedure TextParameter(Name: Text; DefaultValue: Text; Required: Boolean) Parameter: Codeunit "JDV Parameter - Text"
    begin
        exit(Parameter(Name, DefaultValue, Required));
    end;

    procedure TextParameter(Name: Text; Required: Boolean) Parameter: Codeunit "JDV Parameter - Text"
    begin
        exit(TextParameter(Name, '', Required));
    end;

    procedure TimeParameter(Name: Text) Parameter: Codeunit "JDV Parameter - Time"
    begin
        exit(TimeParameter(Name, 0T));
    end;

    procedure TimeParameter(Name: Text; DefaultValue: Time) Parameter: Codeunit "JDV Parameter - Time"
    begin
        exit(TimeParameter(Name, DefaultValue, false));
    end;

    procedure TimeParameter(Name: Text; DefaultValue: Time; Required: Boolean) Parameter: Codeunit "JDV Parameter - Time"
    begin
        exit(Parameter(Name, DefaultValue, Required));
    end;
}
