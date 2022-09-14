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
        parameterKeyValues: Dictionary of [Text, Decimal];
        parameterString: Text;
        keyValue: Text;
    begin
        // [SCENARIO #0001] Parameter has negative value
        Initialize();

        // [GIVEN] Parameter has a value less than zero
        parameterString := CreateParameterHasAValueLessThanZero();

        // [WHEN] Parse parameters
        ParseParameters(parameterString, parameterKeyValues);
        keyValue := parameterKeyValues.Keys.Get(1);

        // [THEN] Only 1 parameter key
        VerifyOnly1ParameterKey(parameterKeyValues);

        // [THEN] Parameter value is negavtive
        VerifyParameterValueIsNegavtive(parameterKeyValues.Get(keyValue));

    end;

    [Test]
    procedure ParametersPassedInOrderNotMatchingSchema()
    // [FEATURE] Kata Args
    var
        ParameterString: Text;
        ParameterKeyValues: Dictionary of [Text, Text];
    begin
        // [SCENARIO #0002] Parameters passed in order not matching schema
        Initialize();

        // [GIVEN] Parameter string not in same order as schema defined
        CreateParameterStringNotInSameOrderAsSchemaDefined();

        // [WHEN] Parse parameters
        ParseParameters(ParameterString, ParameterKeyValues);

        // [THEN] Parameters are parsed correctly
        VerifyParametersAreParsedCorrectly();

    end;

    [Test]
    procedure ParameterDefaultValues()
    // [FEATURE] Kata Args
    var
        ParameterString: Text;
        ParameterKeyValues: Dictionary of [Text, Text];
    begin
        // [SCENARIO #0003] Parameter default values
        Initialize();

        // [GIVEN] Parameter string with missing keys
        CreateParameterStringWithMissingKeys();

        // [WHEN] Parse parameters
        ParseParameters(ParameterString, ParameterKeyValues);

        // [THEN] Missing parameters has default values
        VerifyMissingParametersHasDefaultValues();

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

    local procedure CreateParameterHasAValueLessThanZero(): Text
    var
        LibraryRandom: Codeunit "Library - Random";
        negativeNumericParameterTxt: Label '-numeric %1', Locked = true;
    begin
        exit(StrSubstNo(negativeNumericParameterTxt, LibraryRandom.RandDecInRange(-1000, -1, 2)));
    end;

    local procedure CreateParameterStringNotInSameOrderAsSchemaDefined()
    begin
        Error('CreateParameterStringNotInSameOrderAsSchemaDefined not implemented.')
    end;

    local procedure CreateParameterStringWithMissingKeys()
    begin
        Error('CreateParameterStringWithMissingKeys not implemented.')
    end;

#pragma warning disable AA0137
    local procedure ParseParameters(parameterString: Text; var parameterKeyValues: Dictionary of [Text, Decimal])
#pragma warning restore AA0137
    var
        JDVParameterHandling: Codeunit "JDV Parameter Handling";
    begin
        JDVParameterHandling.ParseParameters(parameterString);
    end;

#pragma warning disable AA0137
    local procedure ParseParameters(parameterString: Text; var parameterKeyValues: Dictionary of [Text, Text])
#pragma warning restore AA0137
    begin
        Error('ParseParameters not implemented.')
    end;

    local procedure VerifyMissingParametersHasDefaultValues()
    begin
        Error('VerifyMissingParametersHasDefaultValues not implemented.')
    end;

    local procedure VerifyOnly1ParameterKey(parameterKeyValues: Dictionary of [Text, Decimal])
    begin
        Assert.AreEqual(1, parameterKeyValues.Count, 'Parameter Count');
    end;

    local procedure VerifyParametersAreParsedCorrectly()
    begin
        Error('VerifyParametersAreParsedCorrectly not implemented.')
    end;

    local procedure VerifyParameterValueIsNegavtive(keyvalue: Decimal)
    begin
        Assert.IsTrue(keyvalue < 0, 'Keyvalue is expected to be negative');
    end;

}

