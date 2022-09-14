interface "JDV ParameterHandler"
{
    Access = Public;
    procedure GetIsRequired(): Boolean;
    procedure GetName(): Text;
    procedure GetDefaultValue(): Variant;
    procedure GetValue(): Variant;

    procedure SetDefaultValue(DefaultValue: Variant);
    procedure SetIsRequired(IsRequire: Boolean);
    procedure SetName(ParameterName: Text);
    procedure SetValue(ParameterValue: Variant);

    procedure Initialized(): Boolean;
    procedure Convert();
}