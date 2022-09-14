codeunit 80002 "JDV Parameter - Boolean" implements "JDV ParameterHandler"
{
    Access = Internal;

    var
        Required: Boolean;
        HasDefaultValue: Boolean;
        HasName: Boolean;
        Name: Text;
        DefaultValueVariant: Variant;
        ValueVariant: Variant;

    procedure GetDefaultValue(): Variant
    begin
        exit(DefaultValueVariant);
    end;

    procedure GetIsRequired(): Boolean
    begin
        exit(Required);
    end;

    procedure GetName(): Text
    begin
        exit(Name);
    end;

    procedure GetValue(): Variant
    begin
        exit(ValueVariant);
    end;

    procedure Initialized(): Boolean
    begin
        exit(HasName and HasDefaultValue);
    end;

    procedure SetDefaultValue(ParameterDefaultValueVariant: Variant)
    begin
        DefaultValueVariant := ParameterDefaultValueVariant;
        ValueVariant := DefaultValueVariant;
        HasDefaultValue := true;
    end;

    procedure SetIsRequired(IsRequired: Boolean)
    begin
        Required := IsRequired;
    end;

    procedure SetName(ParameterName: Text)
    begin
        Name := ParameterName;
        HasName := true;
    end;

    procedure SetValue(ParameterValueVariant: Variant)
    begin
        ValueVariant := ParameterValueVariant;
    end;

    procedure Convert()
    var
        JDVParameterMgt: Codeunit "JDV Parameter Mgt.";
        ValueRequiredErr: Label 'Boolean parameter ''%1'' must have a value specified.', Comment = '%1 is parameter name';
    begin
        if Format(ValueVariant) = '' then
            Error(ValueRequiredErr, Name);

        ValueVariant := JDVParameterMgt.ConvertToBoolean(Format(ValueVariant));
    end;
}