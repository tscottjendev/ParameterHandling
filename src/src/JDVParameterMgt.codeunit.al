codeunit 80001 "JDV Parameter Mgt."
{
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


    procedure ConvertToBoolean(BooleanText: Text) Value: Boolean
    begin
        Evaluate(Value, BooleanText);

        exit(Value);
    end;

    procedure ConvertToCode(CodeValue: Text) Value: Code[2048]
    begin
        Evaluate(Value, CodeValue);

        exit(Value);
    end;

    procedure ConvertToDate(DateText: Text) Value: Date
    begin
        Evaluate(Value, DateText);

        exit(Value);
    end;

    procedure ConvertToDateFormula(DateFormulaText: Text) Value: DateFormula
    begin
        Evaluate(Value, DateFormulaText);

        exit(Value);
    end;

    procedure ConvertToDateTime(DateTimeText: Text) Value: DateTime
    begin
        Evaluate(Value, DateTimeText);

        exit(Value);
    end;

    procedure ConvertToDecimal(DecimalText: Text) Value: Decimal
    begin
        Evaluate(Value, DecimalText);

        exit(Value);
    end;

    procedure ConvertToInteger(IntegerText: Text) Value: Integer
    begin
        Evaluate(Value, IntegerText);

        exit(Value);
    end;

    procedure ConvertToText(TextValue: Text) Value: Text
    begin
        Evaluate(Value, TextValue);

        exit(Value);
    end;

    procedure ConvertToTime(TimeText: Text) Value: Time
    begin
        Evaluate(Value, TimeText);

        exit(Value);
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

    procedure DateParameter(Name: Text; DefaultValue: Date) Parameter: Codeunit "JDV Parameter - Date"
    begin
        exit(Parameter(Name, 0D));
    end;

    procedure DateParameter(Name: Text; DefaultValue: Date; Required: Boolean) Parameter: Codeunit "JDV Parameter - Date"
    begin
        exit(Parameter(Name, 0D, Required));
    end;

    procedure DateTimeParameter(Name: Text) Parameter: Codeunit "JDV Parameter - DateTime"
    begin
        exit(Parameter(Name, 0DT));
    end;

    procedure DateTimeParameter(Name: Text; Required: Boolean) Parameter: Codeunit "JDV Parameter - DateTime"
    begin
        exit(Parameter(Name, 0DT, Required));
    end;

    procedure DecimalParameter(Name: Text; DefaultValue: Decimal) Parameter: Codeunit "JDV Parameter - Decimal"
    begin
        exit(Parameter(Name, 0.0));
    end;

    procedure DecimalParameter(Name: Text; DefaultValue: Decimal; Required: Boolean) Parameter: Codeunit "JDV Parameter - Decimal"
    begin
        exit(Parameter(Name, 0.0, Required));
    end;

    procedure IntegerParameter(Name: Text) Parameter: Codeunit "JDV Parameter - Integer"
    begin
        exit(Parameter(Name, 0));
    end;

    procedure IntegerParameter(Name: Text; Required: Boolean) Parameter: Codeunit "JDV Parameter - Integer"
    begin
        exit(Parameter(Name, 0, Required));
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
        Parameter.SetName(Name);
        Parameter.SetDefaultValue(DefaultValue);
        Parameter.SetIsRequired(Required);

        exit(Parameter);
    end;

    procedure Parameter(Name: Text; DefaultValue: Code[2048]; Required: Boolean) Parameter: Codeunit "JDV Parameter - Code"
    begin
        Parameter.SetName(Name);
        Parameter.SetDefaultValue(DefaultValue);
        Parameter.SetIsRequired(Required);

        exit(Parameter);
    end;

    procedure Parameter(Name: Text; DefaultValue: Boolean; Required: Boolean) Parameter: Codeunit "JDV Parameter - Boolean"
    begin
        Parameter.SetName(Name);
        Parameter.SetDefaultValue(DefaultValue);
        Parameter.SetIsRequired(Required);

        exit(Parameter);
    end;

    procedure Parameter(Name: Text; DefaultValue: Integer; Required: Boolean) Parameter: Codeunit "JDV Parameter - Integer"
    begin
        Parameter.SetName(Name);
        Parameter.SetDefaultValue(DefaultValue);
        Parameter.SetIsRequired(Required);

        exit(Parameter);
    end;

    procedure Parameter(Name: Text; DefaultValue: DateTime; Required: Boolean) Parameter: Codeunit "JDV Parameter - DateTime"
    begin
        Parameter.SetName(Name);
        Parameter.SetDefaultValue(DefaultValue);
        Parameter.SetIsRequired(Required);

        exit(Parameter);
    end;

    procedure Parameter(Name: Text; DefaultValue: DateFormula; Required: Boolean) Parameter: Codeunit "JDV Parameter - DateFormula"
    begin
        Parameter.SetName(Name);
        Parameter.SetDefaultValue(DefaultValue);
        Parameter.SetIsRequired(Required);

        exit(Parameter);
    end;

    procedure Parameter(Name: Text; DefaultValue: Decimal; Required: Boolean) Parameter: Codeunit "JDV Parameter - Decimal"
    begin
        Parameter.SetName(Name);
        Parameter.SetDefaultValue(DefaultValue);
        Parameter.SetIsRequired(Required);

        exit(Parameter);
    end;

    procedure Parameter(Name: Text; DefaultValue: Date; Required: Boolean) Parameter: Codeunit "JDV Parameter - Date"
    begin
        Parameter.SetName(Name);
        Parameter.SetDefaultValue(DefaultValue);
        Parameter.SetIsRequired(Required);

        exit(Parameter);
    end;

    procedure Parameter(Name: Text; DefaultValue: Time; Required: Boolean) Parameter: Codeunit "JDV Parameter - Time"
    begin
        Parameter.SetName(Name);
        Parameter.SetDefaultValue(DefaultValue);
        Parameter.SetIsRequired(Required);

        exit(Parameter);
    end;

    procedure SwitchParameter(Name: Text) Parameter: Codeunit "JDV Parameter - Switch"
    begin
        exit(SwitchParameter(Name, false));
    end;

    procedure SwitchParameter(Name: Text; Required: Boolean) Parameter: Codeunit "JDV Parameter - Switch"
    begin
        Parameter.SetName(Name);
        Parameter.SetDefaultValue(false);
        Parameter.SetIsRequired(Required);
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

    procedure TimeParameter(Name: Text; DefaultValue: Time) Parameter: Codeunit "JDV Parameter - Time"
    begin
        exit(Parameter(Name, DefaultValue));
    end;

    procedure TimeParameter(Name: Text; DefaultValue: Time; Required: Boolean) Parameter: Codeunit "JDV Parameter - Time"
    begin
        exit(Parameter(Name, DefaultValue, Required));
    end;
}
