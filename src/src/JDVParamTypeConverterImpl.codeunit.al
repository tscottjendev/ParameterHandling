codeunit 80013 "JDV Param. Type Converter Impl"
{
    Access = Internal;

    trigger OnRun()
    begin
        Error('Do not run this object.');
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
}
