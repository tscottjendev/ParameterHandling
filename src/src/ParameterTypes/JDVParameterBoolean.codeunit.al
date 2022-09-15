codeunit 80002 "JDV Parameter - Boolean" implements "JDV Parameter Handler"
{
    /// <summary>
    /// Provides a boolean parameter instance.
    /// </summary>
    var
        Required: Boolean;
        HasDefaultValue: Boolean;
        HasName: Boolean;
        Name: Text;
        DefaultValueVariant: Variant;
        ValueVariant: Variant;

    /// <inheritdoc cref="Convert()"/>
    procedure Convert()
    var
        JDVParameterMgt: Codeunit "JDV Parameter Mgt.";
        ValueRequiredErr: Label 'Boolean parameter ''%1'' must have a value specified.', Comment = '%1 is parameter name';
    begin
        if Format(ValueVariant) = '' then
            Error(ValueRequiredErr, Name);

        ValueVariant := JDVParameterMgt.ConvertToBoolean(Format(ValueVariant));
    end;

    /// <inheritdoc cref="GetDefaultValue()"/>
    procedure GetDefaultValue(): Variant
    begin
        exit(DefaultValueVariant);
    end;

    /// <inheritdoc cref="GetIsRequired()"/>
    procedure GetIsRequired(): Boolean
    begin
        exit(Required);
    end;

    /// <inheritdoc cref="GetName()"/>
    procedure GetName(): Text
    begin
        exit(Name);
    end;

    /// <inheritdoc cref="GetValue()"/>
    procedure GetValue(): Variant
    begin
        exit(ValueVariant);
    end;

    /// <inheritdoc cref="Initialized()"/>
    procedure Initialized(): Boolean
    begin
        exit(HasName and HasDefaultValue);
    end;

    /// <inheritdoc cref="SetDefaultValue(ParameterDefaultValueVariant: Variant)"/>
    procedure SetDefaultValue(ParameterDefaultValueVariant: Variant)
    begin
        DefaultValueVariant := ParameterDefaultValueVariant;
        ValueVariant := DefaultValueVariant;
        HasDefaultValue := true;
    end;

    /// <inheritdoc cref="SetIsRequired(IsRequired: Boolean)"/>
    procedure SetIsRequired(IsRequired: Boolean)
    begin
        Required := IsRequired;
    end;

    /// <inheritdoc cref="SetName(ParameterName: Text)"/>
    procedure SetName(ParameterName: Text)
    begin
        Name := ParameterName;
        HasName := true;
    end;

    /// <inheritdoc cref="SetValue(ParameterValueVariant: Variant)"/>
    procedure SetValue(ParameterValueVariant: Variant)
    begin
        ValueVariant := ParameterValueVariant;
    end;
}