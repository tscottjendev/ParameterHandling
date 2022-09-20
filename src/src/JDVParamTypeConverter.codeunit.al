codeunit 80014 "JDV Param. Type Converter"
{
    Access = Public;

    trigger OnRun()
    begin
        Error('Do not run this object.');
    end;

    procedure ConvertToBoolean(BooleanText: Text) Value: Boolean
    var
        JDVParamTypeConverterImpl: Codeunit "JDV Param. Type Converter Impl";

    begin
        exit(JDVParamTypeConverterImpl.ConvertToBoolean(BooleanText));
    end;

    procedure ConvertToCode(CodeValue: Text) Value: Code[2048]
    var
        JDVParamTypeConverterImpl: Codeunit "JDV Param. Type Converter Impl";
    begin
        exit(JDVParamTypeConverterImpl.ConvertToCode(CodeValue));
    end;

    procedure ConvertToDate(DateText: Text) Value: Date
    var
        JDVParamTypeConverterImpl: Codeunit "JDV Param. Type Converter Impl";
    begin
        exit(JDVParamTypeConverterImpl.ConvertToDate(DateText));
    end;

    procedure ConvertToDateFormula(DateFormulaText: Text) Value: DateFormula
    var
        JDVParamTypeConverterImpl: Codeunit "JDV Param. Type Converter Impl";
    begin
        exit(JDVParamTypeConverterImpl.ConvertToDateFormula(DateFormulaText));
    end;

    procedure ConvertToDateTime(DateTimeText: Text) Value: DateTime
    var
        JDVParamTypeConverterImpl: Codeunit "JDV Param. Type Converter Impl";
    begin
        exit(JDVParamTypeConverterImpl.ConvertToDateTime(DateTimeText));
    end;

    procedure ConvertToDecimal(DecimalText: Text) Value: Decimal
    var
        JDVParamTypeConverterImpl: Codeunit "JDV Param. Type Converter Impl";
    begin
        exit(JDVParamTypeConverterImpl.ConvertToDecimal(DecimalText));
    end;

    procedure ConvertToInteger(IntegerText: Text) Value: Integer
    var
        JDVParamTypeConverterImpl: Codeunit "JDV Param. Type Converter Impl";
    begin
        exit(JDVParamTypeConverterImpl.ConvertToInteger(IntegerText));
    end;

    procedure ConvertToText(TextValue: Text) Value: Text
    var
        JDVParamTypeConverterImpl: Codeunit "JDV Param. Type Converter Impl";
    begin
        exit(JDVParamTypeConverterImpl.ConvertToText(TextValue));
    end;

    procedure ConvertToTime(TimeText: Text) Value: Time
    var
        JDVParamTypeConverterImpl: Codeunit "JDV Param. Type Converter Impl";
    begin
        exit(JDVParamTypeConverterImpl.ConvertToTime(TimeText));
    end;

}
