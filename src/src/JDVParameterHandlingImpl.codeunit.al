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
        ParameterString: Text;

    procedure AddAllowedParameter(Parameter: Interface "JDV Parameter Handler")
    begin
        TestParameter(Parameter);
        AllowedNames.Add(Parameter.GetName());
        AllowedParameters[AllowedNames.IndexOf(Parameter.GetName())] := Parameter;
        if Parameter.GetIsRequired() then
            RequiredNames.Add(Parameter.GetName());
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
                AllowedNames.Add(Parameters[Index].GetName());
                AllowedParameters[AllowedNames.IndexOf(Parameters[Index].GetName())] := Parameters[Index];
            end;
    end;

    procedure GetParameterString(): Text;
    begin
        exit(GetParameterString(false));
    end;

    procedure GetParameterString(IncludeAll: Boolean): Text;
    begin
        if IncludeAll then
            exit(BuildFullParameterString());

        exit(ParameterString);
    end;

    procedure GetParameterValue(ParameterName: Text) ParameterValue: Variant
    begin
        exit(AllowedParameters[AllowedNames.IndexOf(ParameterName)].GetValue());
    end;

    procedure ParameterCount(): Integer
    begin
        exit(AllowedNames.Count);
    end;

    procedure ParseParameters(NewParameterString: Text)
    var
        ParameterStringBuilder: TextBuilder;
        ParameterValueVariant: Variant;
        ParameterName: Text;
        Parameter: Text;
        Part: Text;
    begin
        Part := NewParameterString.Trim();
        repeat
            ParameterName := ParseParameterName(Part);
            TestAllowed(ParameterName);
            TestDuplicate(ParameterName);

            ReceivedNames.Add(ParameterName);

            ParameterValueVariant := ParseParameterValue(ParameterName, Part);
            SetParameterValue(ParameterName, ParameterValueVariant);

            Parameter := BuildParameter(ParameterName, ParameterValueVariant);
            ParameterStringBuilder.Append(Parameter);
            ParameterStringBuilder.Append(ParameterSeparator());

            Part := NewParameterString.Substring(NewParameterString.IndexOf(Parameter) + StrLen(Parameter)).Trim();
        until (ParameterStringBuilder.ToText().TrimEnd() = NewParameterString);
        ParameterString := ParameterStringBuilder.ToText().TrimEnd();

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
                StringBuilder.Append(AllowedParameters[Index].GetName());
                StringBuilder.Append(ParameterSeparator());
                StringBuilder.Append(Format(AllowedParameters[Index].GetValue()));
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

    local procedure ParseParameterValue(PartName: Text; Part: Text): Text
    var
        Index: Integer;
        Separator: Text[2];
        ValueBuilder: TextBuilder;
    begin
        Part := Part.Substring(Part.IndexOf(PartName) + StrLen(PartName) + 1);
        Separator := ParameterSeparator() + ParameterIdentifier();

        Index := 1;
        while (Part.Substring(Index, StrLen(Separator)) <> Separator)
            and (Index <= StrLen(Part))
        do begin
            ValueBuilder.Append(Part[Index]);
            Index += 1;

            if Index = StrLen(Part) then begin
                ValueBuilder.Append(Part[Index]);
                exit(ValueBuilder.ToText());
            end;
        end;

        exit(ValueBuilder.ToText());
    end;

    local procedure SetParameterValue(Name: Text; ValueVariant: Variant)
    var
        Parameter: Interface "JDV Parameter Handler";
    begin
        Parameter := AllowedParameters[AllowedNames.IndexOf(Name)];
        Parameter.SetValue(ValueVariant);
        Parameter.Convert();
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
        if AllowedNames.Contains(Parameter.GetName()) then
            Error(DuplicateParameterErr, Parameter.GetName());
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
}