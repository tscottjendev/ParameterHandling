codeunit 90000 "JDV Parameters UT"
{
    Subtype = Test;

    trigger OnRun()
    begin
        // [FEATURE] ParameterHandling
    end;

    var
        Assert: Codeunit Assert;

    var
        IsInitialized: Boolean;

    [Test]
    procedure ParameterDefaultValues()
    // [FEATURE] ParameterHandling
    var
        JDVParameterHandling: Codeunit "JDV Parameter Handling";
        Parameters: array[3] of Interface "JDV Parameter Handler";
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

    [Test]
    procedure ParameterHasNegativeValue()
    // [FEATURE] ParameterHandling
    var
        JDVParameterHandling: Codeunit "JDV Parameter Handling";
        JDVParameterHandler: Interface "JDV Parameter Handler";
        ParameterString: Text;
        ParameterValue: Decimal;
        ParameterName: Text;
    begin
        // [SCENARIO #0001] Parameter has negative value
        Initialize();

        //[GIVEN] A numeric parameter
        JDVParameterHandler := CreateNumericParameter();
        ParameterName := JDVParameterHandler.Name();

        // [GIVEN] Parameter has a value less than zero
        ParameterString := CreateParameterStringHasAValueLessThanZero(ParameterName);

        // [WHEN] Parse parameters
        JDVParameterHandling := ParseParameters(ParameterString, JDVParameterHandler);
        ParameterValue := JDVParameterHandling.ParameterValue(ParameterName);

        // [THEN] Parameter value is negavtive
        VerifyParameterValueIsNegavtive(ParameterValue);
    end;

    [Test]
    procedure PassDuplicateInParameterString()
    // [FEATURE] ParameterHandling
    var
        JDVParameterHandling: Codeunit "JDV Parameter Handling";
        Parameters: array[3] of Interface "JDV Parameter Handler";
        DuplicateParameter: Interface "JDV Parameter Handler";
        ParameterString: Text;
    begin
        // [SCENARIO #0002] Pass Duplicate Parameter
        Initialize();

        //[GIVEN] A Set of Parameters
        CreateSetOfParameters(Parameters);

        //[GIVEN] Duplicate Parameter
        DuplicateParameter := CreateDuplicateParameter(Parameters);

        // [GIVEN] Parameter string contains parameter not in parameter set
        ParameterString := CreateParameterStringWithDuplicateParameterInString(Parameters, DuplicateParameter);

        // [WHEN] Parse parameters
        asserterror JDVParameterHandling := ParseParameters(ParameterString, Parameters);

        // [THEN] Duplicate parameter in string error was thrown
        VerifyDuplicateParameterInStringError(DuplicateParameter);
    end;

    [Test]
    procedure PassDuplicateParameter()
    // [FEATURE] ParameterHandling
    var
        JDVParameterHandling: Codeunit "JDV Parameter Handling";
        Parameters: array[3] of Interface "JDV Parameter Handler";
        DuplicateParameter: Interface "JDV Parameter Handler";
        ParameterString: Text;
    begin
        // [SCENARIO #0002] Pass Duplicate Parameter
        Initialize();

        //[GIVEN] A Set of Parameters
        CreateSetOfParameters(Parameters);

        //[GIVEN] A Set of Parametrs
        DuplicateParameter := CreateDuplicateParameter(Parameters);

        // [GIVEN] Parameter string contains with duplicate parameter in parameter set
        ParameterString := CreateParameterStringWithDuplicateParameter(Parameters, DuplicateParameter);

        // [WHEN] Parse parameters
        asserterror JDVParameterHandling := ParseParameters(ParameterString, Parameters, DuplicateParameter);

        // [THEN] Invalid parameter error was thrown
        VerifyDuplicateParameterError(DuplicateParameter);
    end;


    [Test]
    procedure PassEmptyParameterString()
    // [FEATURE] ParameterHandling
    var
        JDVParameterHandling: Codeunit "JDV Parameter Handling";
        Parameters: array[3] of Interface "JDV Parameter Handler";
        ParameterString: Text;
    begin
        // [SCENARIO #0002] Pass Empty Parameter string
        Initialize();

        //[GIVEN] A Set of Parameters
        CreateSetOfParameters(Parameters);

        // [WHEN] Parse parameters
        ParameterString := '';
        asserterror JDVParameterHandling := ParseParameters(ParameterString, Parameters);

        // [THEN] Invalid parameter string error was thrown
        VerifyInvalidParameterStringError(ParameterString);
    end;

    [Test]
    procedure PassHypenInValueInParameterString()
    // [FEATURE] ParameterHandling
    var
        JDVParameterHandling: Codeunit "JDV Parameter Handling";
        HyphenJDVParameterText: Codeunit "JDV Parameter - Text";
        Parameters: array[3] of Interface "JDV Parameter Handler";
        ParameterString: Text;
    begin
        // [SCENARIO #0002] Pass Hypen (-) in the value in the Parameter string
        Initialize();

        //[GIVEN] A Set of Parameters
        CreateSetOfParameters(Parameters);

        //[GIVEN] Duplicate Parameter
        HyphenJDVParameterText := CreateParameterWithHyphen();

        // [GIVEN] Parameter string with hypen
        ParameterString := CreateParameterStringWithHyphen(Parameters, HyphenJDVParameterText);

        // [WHEN] Parse parameters
        JDVParameterHandling := ParseParameters(ParameterString, Parameters, HyphenJDVParameterText);

        // [THEN] Parameter strings match
        VerifyParameterStringsMatch(JDVParameterHandling, ParameterString);
    end;

    [Test]
    procedure PassUnexpectedParameter()
    // [FEATURE] ParameterHandling
    var
        JDVParameterHandling: Codeunit "JDV Parameter Handling";
        Parameters: array[3] of Interface "JDV Parameter Handler";
        InvalidParameter: Interface "JDV Parameter Handler";
        ParameterString: Text;
    begin
        // [SCENARIO #0002] Pass Unexpected Parameter
        Initialize();

        //[GIVEN] A Set of Parameters
        CreateSetOfParameters(Parameters);

        //[GIVEN] A Set of Parametrs
        InvalidParameter := CreateInvalidParameter();

        // [GIVEN] Parameter string contains parameter not in parameter set
        ParameterString := CreateParameterStringWithInvalidParameter(Parameters, InvalidParameter);

        // [WHEN] Parse parameters
        asserterror JDVParameterHandling := ParseParameters(ParameterString, Parameters);

        // [THEN] Invalid parameter error was thrown
        VerifyInvalidParameterError(InvalidParameter);
    end;

    local procedure CreateDuplicateParameter(var Parameters: array[3] of Interface "JDV Parameter Handler") Parameter: Codeunit "JDV Parameter - Text";
    var
        LibraryRandom: Codeunit "Library - Random";
        Index: Integer;
    begin
        Index := LibraryRandom.RandIntInRange(1, ArrayLen(Parameters));
        Parameter.Name(Parameters[Index].Name());
        Parameter.DefaultValue(LibraryRandom.RandText(10));

        exit(Parameter);
    end;

    local procedure CreateInvalidParameter() Parameter: Codeunit "JDV Parameter - Text";
    var
        LibraryRandom: Codeunit "Library - Random";
    begin
        Parameter.Name('X' + LibraryRandom.RandText(5));
        Parameter.DefaultValue(LibraryRandom.RandText(10));

        exit(Parameter);
    end;

    local procedure CreateMultipleParameters(var Parameters: array[3] of Interface "JDV Parameter Handler") Defaults: Dictionary of [Text, Text]
    var
        JDVParameterText: Codeunit "JDV Parameter - Text";
        LibraryRandom: Codeunit "Library - Random";
        i: Integer;
    begin
        for i := 1 to ArrayLen(Parameters) do begin
            Clear(JDVParameterText);
            JDVParameterText.Name('P' + LibraryRandom.RandText(5));
            JDVParameterText.DefaultValue(LibraryRandom.RandText(10));
            Defaults.Add(JDVParameterText.Name(), JDVParameterText.DefaultValue());
            Parameters[i] := JDVParameterText;
        end;
    end;

    local procedure CreateNumericParameter(): Interface "JDV Parameter Handler"
    var
        JDVParameterDecimal: Codeunit "JDV Parameter - Decimal";
    begin
        JDVParameterDecimal.Name('DecimalParam');
        JDVParameterDecimal.DefaultValue(0);

        exit(JDVParameterDecimal);
    end;

    local procedure CreateParameterStringHasAValueLessThanZero(ParameterName: Text): Text
    var
        LibraryRandom: Codeunit "Library - Random";
        NegativeNumericParameterTxt: Label '-%1 %2', Locked = true;
    begin
        exit(StrSubstNo(NegativeNumericParameterTxt, ParameterName, LibraryRandom.RandDecInRange(-1000, -1, 2)));
    end;

    local procedure CreateParameterStringWithDuplicateParameter(Parameters: array[3] of Interface "JDV Parameter Handler"; DuplicateParameter: Interface "JDV Parameter Handler"): Text
    begin
        exit(CreateParameterStringWithExtraParameter(Parameters, DuplicateParameter));
    end;

    local procedure CreateParameterStringWithDuplicateParameterInString(Parameters: array[3] of Interface "JDV Parameter Handler"; DuplicateParameter: Interface "JDV Parameter Handler"): Text
    begin
        exit(CreateParameterStringWithExtraParameter(Parameters, DuplicateParameter));
    end;

    local procedure CreateParameterStringWithExtraParameter(Parameters: array[3] of Interface "JDV Parameter Handler"; ExtraParameter: Interface "JDV Parameter Handler"): Text
    var
        LibraryRandom: Codeunit "Library - Random";
        Pairs: List of [Text];
        i: Integer;
        Length: Integer;
        ParameterKeyValueTxt: Label '-%1 %2', Locked = true;
        ParameterStringTxt: Label '%1 %2 %3 %4', Locked = true;
    begin
        Length := ArrayLen(Parameters);
        for i := 1 to Length do
            Pairs.Add(StrSubstNo(ParameterKeyValueTxt, Parameters[i].Name(), LibraryRandom.RandText(10)));

        exit(StrSubstNo(ParameterStringTxt
            , Pairs.Get(1)
            , Pairs.Get(2)
            , Pairs.Get(3)
            , StrSubstNo(ParameterKeyValueTxt
                , ExtraParameter.Name()
                , ExtraParameter.DefaultValue())));
    end;

    local procedure CreateParameterStringWithHyphen(Parameters: array[3] of Interface "JDV Parameter Handler"; DuplicateParameter: Interface "JDV Parameter Handler"): Text
    begin
        exit(CreateParameterStringWithExtraParameter(Parameters, DuplicateParameter));
    end;

    local procedure CreateParameterStringWithInvalidParameter(Parameters: array[3] of Interface "JDV Parameter Handler"; InvalidParameter: Interface "JDV Parameter Handler"): Text
    begin
        exit(CreateParameterStringWithExtraParameter(Parameters, InvalidParameter));
    end;

    local procedure CreateParameterStringWithMissingKeys(var Parameters: array[3] of Interface "JDV Parameter Handler"): Text
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
                Pairs.Add(StrSubstNo(ParameterKeyValueTxt, Parameters[i].Name(), LibraryRandom.RandText(10)));

        exit(StrSubstNo(ParameterStringTxt, Pairs.Get(1), Pairs.Get(2)));
    end;

    local procedure CreateParameterWithHyphen() Parameter: Codeunit "JDV Parameter - Text";
    var
        LibraryRandom: Codeunit "Library - Random";
    begin
        Parameter.Name('X' + LibraryRandom.RandText(5));
        Parameter.DefaultValue(LibraryRandom.RandText(4) + '-' + LibraryRandom.RandText(5));

        exit(Parameter);
    end;

    local procedure CreateSetOfParameters(var Parameters: array[3] of Interface "JDV Parameter Handler")
    var
        JDVParameterText: Codeunit "JDV Parameter - Text";
        LibraryRandom: Codeunit "Library - Random";
        i: Integer;
    begin
        for i := 1 to ArrayLen(Parameters) do begin
            Clear(JDVParameterText);
            JDVParameterText.Name('P' + LibraryRandom.RandText(5));
            JDVParameterText.DefaultValue(LibraryRandom.RandText(10));
            Parameters[i] := JDVParameterText;
        end;
    end;

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

    local procedure MissingParameterIndex(Length: Integer): Integer
    begin
        TestArrayLen(Length);
        exit(2);
    end;

    local procedure ParseParameters(ParameterString: Text; Parameter: Interface "JDV Parameter Handler") JDVParameterHandling: Codeunit "JDV Parameter Handling"
    begin
        JDVParameterHandling.AddAllowedParameter(Parameter);
        JDVParameterHandling.ParseParameters(ParameterString);
    end;

    local procedure ParseParameters(ParameterString: Text; var Parameters: array[3] of Interface "JDV Parameter Handler") JDVParameterHandling: Codeunit "JDV Parameter Handling"
    var
        i: Integer;
    begin
        for i := 1 to ArrayLen(Parameters) do
            JDVParameterHandling.AddAllowedParameter(Parameters[i]);

        JDVParameterHandling.ParseParameters(ParameterString);
    end;

    local procedure ParseParameters(ParameterString: Text; var Parameters: array[3] of Interface "JDV Parameter Handler"; Parameter: Interface "JDV Parameter Handler") JDVParameterHandling: Codeunit "JDV Parameter Handling"
    var
        i: Integer;
    begin
        for i := 1 to ArrayLen(Parameters) do
            JDVParameterHandling.AddAllowedParameter(Parameters[i]);

        JDVParameterHandling.AddAllowedParameter(Parameter);
        JDVParameterHandling.ParseParameters(ParameterString);
    end;

    local procedure TestArrayLen(Length: Integer)
    begin
        Assert.AreEqual(3, Length, 'Parameter array lenght is incorrect.');
    end;

    local procedure VerifyDuplicateParameterError(Parameter: Interface "JDV Parameter Handler")
    var
        DuplicateParameterErr: Label 'Parameter ''%1'' can only be specified once.', Comment = '%1 is the parameter name';
    begin
        Assert.ExpectedError(
            StrSubstNo(DuplicateParameterErr, Parameter.Name()));
    end;

    local procedure VerifyDuplicateParameterInStringError(Parameter: Interface "JDV Parameter Handler")
    var
        DuplicateInStringErr: Label 'Parameter ''%1'' appears more than once in the parameter string.', Comment = '%1 is parameter name';
    begin
        Assert.ExpectedError(
            StrSubstNo(DuplicateInStringErr, Parameter.Name()));
    end;

    local procedure VerifyInvalidParameterError(Parameter: Interface "JDV Parameter Handler")
    var
        NotRecognizedErr: Label 'Parameter ''%1'' is not a recognized parameter.', Comment = '%1 is parameter name';
    begin
        Assert.ExpectedError(
            StrSubstNo(NotRecognizedErr, Parameter.Name()));
    end;

    local procedure VerifyInvalidParameterStringError(ParameterString: Text)
    var
        InvalidParameterStringErr: Label 'Invalid parameter string - ''%1''', Comment = '%1 is the parameter string';
    begin
        Assert.ExpectedError(
            StrSubstNo(InvalidParameterStringErr, ParameterString));
    end;

    local procedure VerifyMissingParametersHasDefaultValues(JDVParameterHandling: Codeunit "JDV Parameter Handling"; DefaultValues: Dictionary of [Text, Text])
    var
        Expected: Text;
        Actual: Text;
        Index: Integer;
    begin
        Index := MissingParameterIndex(JDVParameterHandling.ParameterCount());
        Expected := DefaultValues.Values().Get(Index);
        Actual := JDVParameterHandling.ParameterValue(DefaultValues.Keys.Get(Index));
        Assert.AreEqual(Expected, Actual, 'Value is expected to be default.');
    end;

    local procedure VerifyParameterStringsMatch(JDVParameterHandling: Codeunit "JDV Parameter Handling"; ExpectedParameterString: Text)
    begin
        Assert.AreEqual(ExpectedParameterString, JDVParameterHandling.ParameterString(), 'Parameter strings must match.');

    end;

    local procedure VerifyParameterValueIsNegavtive(Value: Decimal)
    begin
        Assert.IsTrue(Value < 0, 'Value is expected to be negative');
    end;
}

