codeunit 80002 "JDV Parameter - Boolean" implements "JDV Parameter Handler"
{
    /// <summary>
    /// Provides a boolean parameter instance.
    /// </summary>
    var
        Required: Boolean;
        HasDefaultValue: Boolean;
        HasName: Boolean;
        _Name: Text;
        DefaultValueVariant: Variant;
        ValueVariant: Variant;

    /// <inheritdoc cref="Convert()"/>
    procedure Convert()
    var
        JDVParamTypeConverter: Codeunit "JDV Param. Type Converter";
        ValueRequiredErr: Label 'Boolean parameter ''%1'' must have a value specified.', Comment = '%1 is parameter name';
    begin
        if Format(ValueVariant) = '' then
            Error(ValueRequiredErr, _Name);

        ValueVariant := JDVParamTypeConverter.ConvertToBoolean(Format(ValueVariant));
    end;

    /// <inheritdoc cref="DefaultValue()"/>
    procedure DefaultValue(): Variant
    begin
        exit(DefaultValueVariant);
    end;

    /// <inheritdoc cref="DefaultValue(ParameterDefaultValueVariant: Variant)"/>
    procedure DefaultValue(ParameterDefaultValueVariant: Variant)
    begin
        DefaultValueVariant := ParameterDefaultValueVariant;
        ValueVariant := DefaultValueVariant;
        HasDefaultValue := true;
    end;

    /// <inheritdoc cref="Initialized()"/>
    procedure Initialized(): Boolean
    begin
        exit(HasName and HasDefaultValue);
    end;

    /// <inheritdoc cref="IsRequired()"/>
    procedure IsRequired(): Boolean
    begin
        exit(Required);
    end;

    /// <inheritdoc cref="IsRequired(IsRequired: Boolean)"/>
    procedure IsRequired(IsRequired: Boolean)
    begin
        Required := IsRequired;
    end;

    /// <inheritdoc cref="Name()"/>
    procedure Name(): Text
    begin
        exit(_Name);
    end;

    /// <inheritdoc cref="Name(ParameterName: Text)"/>
    procedure Name(ParameterName: Text)
    begin
        _Name := ParameterName;
        HasName := true;
    end;

    /// <inheritdoc cref="Value()"/>
    procedure Value(): Variant
    begin
        exit(ValueVariant);
    end;

    /// <inheritdoc cref="Value(ParameterValueVariant: Variant)"/>
    procedure Value(ParameterValueVariant: Variant)
    begin
        ValueVariant := ParameterValueVariant;
    end;
}