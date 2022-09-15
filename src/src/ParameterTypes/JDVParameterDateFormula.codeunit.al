codeunit 80005 "JDV Parameter - DateFormula" implements "JDV ParameterHandler"
{
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
    begin
        ValueVariant := JDVParameterMgt.ConvertToDateFormula(Format(ValueVariant));
    end;
}