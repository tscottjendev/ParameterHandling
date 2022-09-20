codeunit 80014 "JDV Parameter Type Converter"
{
    trigger OnRun()
    begin
        Error('Do not run this object.');
    end;

    procedure ConvertToBoolean(BooleanText: Text) Value: Boolean
    var
        JDVParameterMgtImpl: Codeunit "JDV Parameter Mgt. Impl.";
    begin
        exit(JDVParameterMgtImpl.ConvertToBoolean(BooleanText));
    end;

    procedure ConvertToCode(CodeValue: Text) Value: Code[2048]
    var
        JDVParameterMgtImpl: Codeunit "JDV Parameter Mgt. Impl.";
    begin
        exit(JDVParameterMgtImpl.ConvertToCode(CodeValue));
    end;

    procedure ConvertToDate(DateText: Text) Value: Date
    var
        JDVParameterMgtImpl: Codeunit "JDV Parameter Mgt. Impl.";
    begin
        exit(JDVParameterMgtImpl.ConvertToDate(DateText));
    end;

    procedure ConvertToDateFormula(DateFormulaText: Text) Value: DateFormula
    var
        JDVParameterMgtImpl: Codeunit "JDV Parameter Mgt. Impl.";
    begin
        exit(JDVParameterMgtImpl.ConvertToDateFormula(DateFormulaText));
    end;

    procedure ConvertToDateTime(DateTimeText: Text) Value: DateTime
    var
        JDVParameterMgtImpl: Codeunit "JDV Parameter Mgt. Impl.";
    begin
        exit(JDVParameterMgtImpl.ConvertToDateTime(DateTimeText));
    end;

    procedure ConvertToDecimal(DecimalText: Text) Value: Decimal
    var
        JDVParameterMgtImpl: Codeunit "JDV Parameter Mgt. Impl.";
    begin
        exit(JDVParameterMgtImpl.ConvertToDecimal(DecimalText));
    end;

    procedure ConvertToInteger(IntegerText: Text) Value: Integer
    var
        JDVParameterMgtImpl: Codeunit "JDV Parameter Mgt. Impl.";
    begin
        exit(JDVParameterMgtImpl.ConvertToInteger(IntegerText));
    end;

    procedure ConvertToText(TextValue: Text) Value: Text
    var
        JDVParameterMgtImpl: Codeunit "JDV Parameter Mgt. Impl.";
    begin
        exit(JDVParameterMgtImpl.ConvertToText(TextValue));
    end;

    procedure ConvertToTime(TimeText: Text) Value: Time
    var
        JDVParameterMgtImpl: Codeunit "JDV Parameter Mgt. Impl.";
    begin
        exit(JDVParameterMgtImpl.ConvertToTime(TimeText));
    end;

}
