codeunit 90000 "JDV Parameters UT"
{
    // Generated on 08/09/2022 at 07:27 by tscott
    /*
        https://codingdojo.org/kata/Args/

        Suggested Test Cases
        make sure you have a test with a negative integer (confusing - sign)
        the order of the arguments need not match the order given in the schema.
        have some tests that suitable default values are correctly assigned if flags given in the schema are missing in the args given.
    */

    Subtype = Test;

    trigger OnRun()
    begin
        // [FEATURE] Kata Args
    end;

    var
        Assert: Codeunit Assert;

    [Test]
    procedure ParameterHasNegativeValue()
    // [FEATURE] Kata Args
    var
        JDVParameterDecimal: Codeunit "JDV Parameter - Decimal";
        JDVParameterHandling: Codeunit "JDV Parameter Handling";
        parameterString: Text;
        ParameterValue: Decimal;
        ParameterName: Text;
    begin
        // [SCENARIO #0001] Parameter has negative value
        Initialize();

        //[GIVEN] A numeric parameter
        JDVParameterDecimal := CreateNumericParameter();
        ParameterName := JDVParameterDecimal.GetName();

        // [GIVEN] Parameter has a value less than zero
        parameterString := CreateParameterStringHasAValueLessThanZero(ParameterName);

        // [WHEN] Parse parameters
        JDVParameterHandling := ParseParameters(parameterString, JDVParameterDecimal);
        ParameterValue := JDVParameterHandling.GetParameterValue(ParameterName);

        // [THEN] Parameter value is negavtive
        VerifyParameterValueIsNegavtive(ParameterValue);

    end;

    [Test]
    procedure ParameterDefaultValues()
    // [FEATURE] Kata Args
    var
        JDVParameterHandling: Codeunit "JDV Parameter Handling";
        Parameters: array[3] of Interface "JDV ParameterHandler";
        Defaults: Dictionary of [Text, Text];
        ParameterString: Text;
    begin
        // [SCENARIO #0003] Parameter default values
        Initialize();

        // [GIVEN] Multiple Parameters
        Defaults := CreateMultipleParameters(Parameters);

        // [GIVEN] Parameter string with missing keys
        ParameterString := CreateParameterStringWithMissingKeys(Parameters);

        // [WHEN] Parse parameters
        JDVParameterHandling := ParseParameters(ParameterString, Parameters);

        // [THEN] Missing parameters has default values
        VerifyMissingParametersHasDefaultValues(JDVParameterHandling, Defaults);

    end;

    var
        IsInitialized: Boolean;

    local procedure Initialize()
    var
        LibraryTestInitialize: Codeunit "Library - Test Initialize";
    begin
        LibraryTestInitialize.OnTestInitialize(Codeunit::"JDV Parameters UT");

        if IsInitialized then
            exit;

        LibraryTestInitialize.OnBeforeTestSuiteInitialize(Codeunit::"JDV Parameters UT");

        IsInitialized := true;
        Commit();  // Close initialize transactions so testing does not have issues

        LibraryTestInitialize.OnAfterTestSuiteInitialize(Codeunit::"JDV Parameters UT");
    end;

    local procedure CreateMultipleParameters(var Parameters: array[3] of Interface "JDV ParameterHandler") Defaults: Dictionary of [Text, Text]
    var
        JDVParameterCode: Codeunit "JDV Parameter - Code";
        LibraryUTUtility: Codeunit "Library UT Utility";
        i: Integer;
    begin
        for i := 1 to ArrayLen(Parameters) do begin
            Clear(JDVParameterCode);
            JDVParameterCode.SetName(LibraryUTUtility.GetNewCode10());
            JDVParameterCode.SetDefaultValue(LibraryUTUtility.GetNewCode10());
            Defaults.Add(JDVParameterCode.GetName(), JDVParameterCode.GetDefaultValue());
            Parameters[i] := JDVParameterCode;
        end;
    end;

    local procedure CreateNumericParameter() Parameter: Codeunit "JDV Parameter - Decimal"
    begin
        Parameter.SetName('DecimalParam');
        Parameter.SetDefaultValue(0);

        exit(Parameter);
    end;

    local procedure CreateParameterStringHasAValueLessThanZero(ParameterName: Text): Text
    var
        LibraryRandom: Codeunit "Library - Random";
        NegativeNumericParameterTxt: Label '-%1 %2', Locked = true;
    begin
        exit(StrSubstNo(NegativeNumericParameterTxt, ParameterName, LibraryRandom.RandDecInRange(-1000, -1, 2)));
    end;

    local procedure CreateParameterStringWithMissingKeys(var Parameters: array[3] of Interface "JDV ParameterHandler"): Text
    var
        LibraryRandom: Codeunit "Library - Random";
        Pairs: List of [Text];
        i: Integer;
        Length: Integer;
        ParameterKeyValueTxt: Label '-%1 %2', Locked = true;
        ParameterStringTxt: Label '%1 %2', Locked = true;
    begin
        Length := ArrayLen(Parameters);
        TestArrayLen(Length);
        for i := 1 to Length do
            if i <> MissingParameterIndex(Length) then
                Pairs.Add(StrSubstNo(ParameterKeyValueTxt, Parameters[i].GetName(), LibraryRandom.RandText(10)));

        exit(StrSubstNo(ParameterStringTxt, Pairs.Get(1), Pairs.Get(2)));
    end;

    local procedure ParseParameters(parameterString: Text; Parameter: Interface "JDV ParameterHandler") JDVParameterHandling: Codeunit "JDV Parameter Handling"
    begin
        JDVParameterHandling.AddAllowedParameter(Parameter);
        JDVParameterHandling.ParseParameters(parameterString);
    end;

    local procedure ParseParameters(parameterString: Text; var Parameters: array[3] of Interface "JDV ParameterHandler") JDVParameterHandling: Codeunit "JDV Parameter Handling"
    var
        i: Integer;
    begin
        for i := 1 to ArrayLen(Parameters) do
            JDVParameterHandling.AddAllowedParameter(Parameters[i]);

        JDVParameterHandling.ParseParameters(parameterString);
    end;

    local procedure VerifyMissingParametersHasDefaultValues(JDVParameterHandling: Codeunit "JDV Parameter Handling"; DefaultValues: Dictionary of [Text, Text])
    var
        Expected: Text;
        Actual: Text;
        Index: Integer;
    begin
        Index := MissingParameterIndex(JDVParameterHandling.Count());
        Expected := DefaultValues.Values().Get(Index);
        Actual := JDVParameterHandling.GetParameterValue(DefaultValues.Keys.Get(Index));
        Assert.AreEqual(Expected, Actual, 'Value is expected to be default.');
    end;

    local procedure VerifyParameterValueIsNegavtive(Value: Decimal)
    begin
        Assert.IsTrue(Value < 0, 'Value is expected to be negative');
    end;

    local procedure MissingParameterIndex(Length: Integer): Integer
    begin
        TestArrayLen(Length);
        exit(2);
    end;

    local procedure TestArrayLen(Length: Integer)
    begin
        Assert.AreEqual(3, Length, 'Parameter array lenght is incorrect.');
    end;

}

