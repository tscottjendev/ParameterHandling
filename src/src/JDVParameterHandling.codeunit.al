codeunit 80000 "JDV Parameter Handling"
{
    Access = Public;
    /// <summary>
    /// Define the parameter schema (allowed parameters) and parse the provided parameter string
    /// </summary>
    trigger OnRun()
    begin
        Error('do not run this object');
    end;

    var
        JDVParameterHandlingImpl: Codeunit "JDV Parameter Handling Impl.";

    /// <summary>
    /// Add a single parameter to the parameter schema.
    /// </summary>
    /// <param name="Parameter">An Interface "JDV Parameter Handler" instance.</param>
    procedure AddAllowedParameter(Parameter: Interface "JDV Parameter Handler")
    begin
        JDVParameterHandlingImpl.AddAllowedParameter(Parameter);
    end;

    /// <summary>
    /// The number of parameters passed in the parameter string.
    /// </summary>
    /// <returns>The number of parameters passed in the parameter string</returns>
    procedure Count(): Integer
    begin
        exit(JDVParameterHandlingImpl.Count());
    end;

    /// <summary>
    /// Add the array of parameters that are valid for the parameter schema.
    /// </summary>
    /// <param name="Parameters">An array[20] of Interface "JDV Parameter Handler" instances.</param>
    procedure DefineAllowedParameters(Parameters: array[20] of Interface "JDV Parameter Handler")
    begin
        JDVParameterHandlingImpl.DefineAllowedParameters(Parameters);
    end;

    /// <summary>
    /// The number of parameters in the schema.
    /// </summary>
    /// <returns>The number of parameters in the schema.</returns>
    procedure ParameterCount(): Integer
    begin
        exit(JDVParameterHandlingImpl.ParameterCount());
    end;

    /// <summary>
    /// Get the parameter string that was parsed.  This is not the original string but the recreated string from the parameters passed. The parameters values will have been converted to their values.
    /// e.g. a boolean parameter can be passed a -boolean 1 and the 1 will be translated to Yes.
    /// </summary>
    /// <returns>The parameter string.</returns>
    procedure ParameterString(): Text;
    begin
        exit(JDVParameterHandlingImpl.ParameterString());
    end;

    /// <summary>
    /// Get the parameter string that was parsed.  This is not the original string but the recreated string from the parameters passed. The parameters values will have been converted to their values.
    /// e.g. a boolean parameter can be passed a -boolean 1 and the 1 will be translated to Yes.
    /// </summary>
    /// <param name="IncludeAll">Pass true to include all parameters in the schema.</param>
    /// <returns>If IncludeAll is true then all parameters defined in the parameter schema are returned.  The values will be either the actual passed values or the defaults of any parameter not included in the paramenter string.</returns>
    procedure ParameterString(IncludeAll: Boolean): Text;
    begin
        exit(JDVParameterHandlingImpl.ParameterString(IncludeAll));
    end;

    /// <summary>
    /// Get the value of a specific parameter.
    /// </summary>
    /// <param name="ParameterName">The name of the parameter whose value is required</param>
    /// <remarks>
    /// The return is of type Variant.  The inner type is determined by the parameter instance in the schema.
    /// </remarks>
    /// <returns>The value of the requested parameter.</returns>
    procedure ParameterValue(ParameterName: Text) ParameterValue: Variant
    begin
        exit(JDVParameterHandlingImpl.ParameterValue(ParameterName));
    end;

    /// <summary>
    /// Parses and validates the provided parameter string.
    /// </summary>
    /// <param name="ParameterString">The parameter string to be parsed.</param>
    procedure ParseParameters(ParameterString: Text)
    begin
        JDVParameterHandlingImpl.ParseParameters(ParameterString);
    end;
}