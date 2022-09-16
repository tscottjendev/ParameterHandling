interface "JDV Parameter Handler"
{
    Access = Public;

    /// <summary>
    /// Converts the value of the parameter instance to the expected value.
    /// </summary>
    /// <remarks>
    /// This procedure is intended for internal use but must be public for the interface.
    /// Using this procedure should not have unexpected consequences.
    /// </remarks>
    procedure Convert();

    /// <summary>
    /// The default value specified for the parameter instance.
    /// </summary>
    /// <remarks>
    /// The returned value is of type Variant.  The actual type is determined by the Convert() procedure.
    /// </remarks>
    /// <returns>The default value of the parameter instance.</returns>
    procedure DefaultValue(): Variant;

    /// <summary>
    /// Specifies the default value for the parameter instance.
    /// </summary>
    /// <param name="DefaultValue">The default value.</param>
    procedure DefaultValue(DefaultValue: Variant);

    /// <summary>
    /// Determines if the parameter instance is fully configured.
    /// </summary>
    /// <remarks>
    /// Name and Default value must be specified for every parameter instance.  There helper functions to assist in creating parameter instances.
    /// </remarks>
    /// <returns>Return value of type Boolean.</returns>
    procedure Initialized(): Boolean;

    /// <summary>
    /// Indicates if the parameter is required to be in the parameter string.
    /// </summary>
    /// <returns>True if parameter is required.</returns>
    procedure IsRequired(): Boolean;

    /// <summary>
    /// Specifies if the parameter instance is required to be in the parameter string.
    /// </summary>
    /// <param name="IsRequired">True to have the paramater required.  Default is false.</param>
    procedure IsRequired(IsRequired: Boolean);

    /// <summary>
    /// The name of the parameter instance.
    /// <remarks>
    /// The name does not include the '-' in the parameter string.
    /// </remarks>
    /// </summary>
    /// <returns>The parameter name.</returns>
    procedure Name(): Text;

    /// <summary>
    /// Specifies the name of the parameter instance in the parameter string.
    /// </summary>
    /// <remarks>
    /// The name does not include the '-' in the parameter string.
    /// Name must start with a letter (A-Z, a-z) or an underscore (_) and can consist only of letters and digits (0-9)
    /// </remarks>
    /// <param name="ParameterName">Text.</param>
    procedure Name(ParameterName: Text);

    /// <summary>
    /// The value of the paramter instance passed in the parameter string parameter instance.
    /// </summary>
    /// <remarks>
    /// The returned value is of type Variant.  The actual type is determined by the Convert() procedure.
    /// </remarks>
    /// <returns>The passed value of the parameter instance.</returns>
    procedure Value(): Variant;

    /// <summary>
    /// Sets the actual value of the parameter instance from the parameter string.
    /// </summary>
    /// <remarks>
    /// This procedure is intended for internal use but must be public for the interface.
    /// Setting this value directly may have unexpected consequences.
    /// </remarks>
    /// <param name="ParameterValue">Passed value</param>
    procedure Value(ParameterValue: Variant);
}