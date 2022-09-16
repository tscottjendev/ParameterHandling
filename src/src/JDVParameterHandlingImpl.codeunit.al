codeunit 80012 "JDV Parameter Handling Impl."
{
    Access = Internal;

    trigger OnRun()
    begin
        Error('do not run this object');
    end;

    var
        AllowedParameters: array[20] of Interface "JDV Parameter Handler";
        AllowedNames: List of [Text];
        ReceivedNames: List of [Text];
        RequiredNames: List of [Text];
        ParameterStringBuilder: TextBuilder;

    procedure AddAllowedParameter(Parameter: Interface "JDV Parameter Handler")
    begin
        TestParameter(Parameter);
        AllowedNames.Add(Parameter.Name());
        AllowedParameters[AllowedNames.IndexOf(Parameter.Name())] := Parameter;
        if Parameter.IsRequired() then
            RequiredNames.Add(Parameter.Name());
    end;

    procedure Count(): Integer
    begin
        exit(ReceivedNames.Count);
    end;

    procedure DefineAllowedParameters(Parameters: array[20] of Interface "JDV Parameter Handler")
    var
        Index: Integer;
    begin
        for Index := 1 to ArrayLen(Parameters) do
            if Parameters[Index].Initialized() then begin
                TestDuplicate(Parameters[Index]);
                AllowedNames.Add(Parameters[Index].Name());
                AllowedParameters[AllowedNames.IndexOf(Parameters[Index].Name())] := Parameters[Index];
            end;
    end;

    procedure ParameterCount(): Integer
    begin
        exit(AllowedNames.Count);
    end;

    procedure ParameterString(): Text;
    begin
        exit(ParameterString(false));
    end;

    procedure ParameterString(IncludeAll: Boolean): Text;
    begin
        if IncludeAll then
            exit(BuildFullParameterString());

        exit(ParameterStringBuilder.ToText().TrimEnd());
    end;

    procedure ParameterValue(ParameterName: Text) ParameterValue: Variant
    begin
        exit(AllowedParameters[AllowedNames.IndexOf(ParameterName)].Value());
    end;

    procedure ParseParameters(IncomingParameterString: Text)
    var
        ParameterValueVariant: Variant;
        ParameterName: Text;
        ParameterTerm: Text;
        Part: Text;
    begin
        Part := IncomingParameterString.Trim();
        repeat
            ParameterName := ParseParameterName(Part);
            TestAllowed(ParameterName);
            TestDuplicate(ParameterName);

            ReceivedNames.Add(ParameterName);

            ParameterValueVariant := ParseParameterValue(ValuePart(Part, ParameterName));
            ParameterValue(ParameterName, ParameterValueVariant);

            ParameterTerm := BuildParameter(ParameterName, ParameterValueVariant);
            UpdateParameterString(ParameterTerm);

            Part := NextPart(IncomingParameterString, ParameterTerm);
        until (ParameterString() = IncomingParameterString);

        TestRequiredParameters();
    end;

    local procedure BuildFullParameterString(): Text
    var
        StringBuilder: TextBuilder;
        Index: Integer;
        Name: Text;
    begin
        foreach Name in AllowedNames do begin
            Index := AllowedNames.IndexOf(Name);
            AllowedParameters[Index].Convert();
            if AllowedParameters[Index].Initialized() then begin
                StringBuilder.Append(ParameterIdentifier());
                StringBuilder.Append(AllowedParameters[Index].Name());
                StringBuilder.Append(ParameterSeparator());
                StringBuilder.Append(Format(AllowedParameters[Index].Value()));
                StringBuilder.Append(ParameterSeparator());
            end;
        end;

        exit(StringBuilder.ToText().TrimEnd());
    end;

    local procedure BuildParameter(ParameterName: Text; ParameterValueVariant: Variant): Text
    var
        PartBuilder: TextBuilder;
    begin
        PartBuilder.Append(ParameterIdentifier());
        PartBuilder.Append(ParameterName);
        PartBuilder.Append(ParameterSeparator());
        PartBuilder.Append(Format(ParameterValueVariant));

        exit(PartBuilder.ToText().TrimEnd());
    end;

    local procedure IsAlphabeticCharacter(Character: Char): Boolean
    begin
        exit((Character in ['A' .. 'Z'])
            or (Character in ['a' .. 'z']));
    end;

    local procedure IsNumericCharacter(Character: Char): Boolean
    begin
        exit((Character in ['0' .. '9']));
    end;

    local procedure IsValidCharacter(Character: Char): Boolean
    begin
        exit((Character = '_')
            or IsAlphabeticCharacter(Character)
            or IsNumericCharacter(Character));
    end;

    local procedure IsValidParameterNameCharacter(Character: Char; IsFirstCharacter: Boolean): Boolean
    begin
        if IsFirstCharacter then
            exit(IsAlphabeticCharacter(Character));

        exit(IsValidCharacter(Character));
    end;

    local procedure NextPart(Part: Text; Parameter: Text): Text
    begin
        exit(Part.Substring(Part.IndexOf(Parameter) + StrLen(Parameter)).Trim());
    end;

    local procedure ParameterDelimiter(): Text
    begin
        exit(ParameterSeparator() + ParameterIdentifier());
    end;

    local procedure ParameterIdentifier(): Text;
    var
        ParameterDelimiterTxt: Label '-', Locked = true;
    begin
        exit(ParameterDelimiterTxt);
    end;

    local procedure ParameterSeparator(): Text;
    var
        ParameterSeparatorTxt: Label ' ', Locked = true;
    begin
        exit(ParameterSeparatorTxt);
    end;

    local procedure ParameterValue(Name: Text; ValueVariant: Variant)
    var
        Parameter: Interface "JDV Parameter Handler";
    begin
        Parameter := AllowedParameters[AllowedNames.IndexOf(Name)];
        Parameter.Value(ValueVariant);
        Parameter.Convert();
    end;

    local procedure ParseParameterName(ParameterString: Text): Text
    var
        NameBuilder: TextBuilder;
        Character: Char;
        Index: Integer;
    begin
        TestValidParameterString(ParameterString);

        for Index := 1 to StrLen(ParameterString) do begin
            Character := ParameterString[Index];
            if IsValidParameterNameCharacter(Character, Index = 2) then
                NameBuilder.Append(Character);

            if Character = ParameterSeparator() then
                exit(NameBuilder.ToText());
        end;

        exit(NameBuilder.ToText());
    end;

    local procedure ParseParameterValue(ValuePart: Text): Text
    var
        Index: Integer;
        ValueBuilder: TextBuilder;
    begin
        Index := 1;
        while (ValuePart.Substring(Index, StrLen(ParameterDelimiter())) <> ParameterDelimiter())
            and (Index <= StrLen(ValuePart))
        do begin
            ValueBuilder.Append(ValuePart[Index]);
            Index += 1;

            if Index = StrLen(ValuePart) then begin
                ValueBuilder.Append(ValuePart[Index]);
                exit(ValueBuilder.ToText());
            end;
        end;

        exit(ValueBuilder.ToText());
    end;

    local procedure TestAllowed(ParameterName: Text)
    var
        NotRecognizedErr: Label 'Parameter ''%1'' is not a recognized parameter.', Comment = '%1 is parameter name';
    begin
        if not AllowedNames.Contains(ParameterName) then
            Error(NotRecognizedErr, ParameterName);
    end;

    local procedure TestDuplicate(ParameterName: Text)
    var
        DuplicateInStringErr: Label 'Parameter ''%1'' appears more than once in the parameter string.', Comment = '%1 is parameter name';
    begin
        if ReceivedNames.Contains(ParameterName) then
            Error(DuplicateInStringErr, ParameterName);
    end;

    local procedure TestDuplicate(Parameter: Interface "JDV Parameter Handler")
    var
        DuplicateParameterErr: Label 'Parameter ''%1'' can only be specified once.', Comment = '%1 is the parameter name';
    begin
        if AllowedNames.Contains(Parameter.Name()) then
            Error(DuplicateParameterErr, Parameter.Name());
    end;

    local procedure TestInitialized(Parameter: Interface "JDV Parameter Handler")
    var
        ParameterNotInitializedErr: Label 'Parameter is not properly configured.';
    begin
        if not Parameter.Initialized() then
            Error(ParameterNotInitializedErr);
    end;

    local procedure TestParameter(Parameter: Interface "JDV Parameter Handler")
    begin
        TestInitialized(Parameter);
        TestDuplicate(Parameter);
    end;

    local procedure TestRequiredParameters()
    var
        Name: Text;
        RequiredParameterMissingErr: Label 'Required parameter ''%1'' is missing from parameter string.', Comment = '%1 is the parameter name';
    begin
        foreach Name in RequiredNames do
            if not ReceivedNames.Contains(Name) then
                Error(RequiredParameterMissingErr, Name);
    end;

    local procedure TestValidParameterString(ParameterString: Text)
    var
        InvalidParameterStringErr: Label 'Invalid parameter string - ''%1''', Comment = '%1 is the parameter string';
    begin
        if not ParameterString.StartsWith(ParameterIdentifier()) then
            Error(InvalidParameterStringErr, ParameterString);

    end;

    local procedure UpdateParameterString(ParameterTerm: Text)
    begin
        ParameterStringBuilder.Append(ParameterTerm);
        ParameterStringBuilder.Append(ParameterSeparator());
    end;

    local procedure ValuePart(Part: Text; ParameterName: Text): Text
    begin
        exit(Part.Substring(Part.IndexOf(ParameterName) + StrLen(ParameterName) + 1));
    end;
}