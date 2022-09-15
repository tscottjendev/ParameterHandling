# ParameterHandling
This extension has been created to handle the parameter string that can be passed to a Job Queue Entry but could be used for any string parsing.

If you have comments, suggestions, pull requests let me know.

**NOTE:** this is in its infancy so there may be radical changes as it matures.
## Usage
### Parameter Types
There is a series of parameter Codeunits that provide typed parameters for most simple AL types (decimal, integer, date, time, datetime, text, code, dateformula, boolean).  The interface `JDV Parameter Handler` can be used to add a new type parameter.
### Initialization
You add instances of parameters to an instance of Codeunit `JDV Parameter Handling` for each possible parameter in the list.  You specify the default value of a parameter if it is not in the parameter string and also specify if a parameter is required.  
### Parsing
Simply pass the provided parameter list to the the `ParseParameters` procedure.  The parameter string will be interpreted.  
- Possible errors:
  - A required parameter is not specified.
  - A parameter in the parameter string is not in the defined parameter list.
  - The same parameter name was defined more than once in the parameter string.
  - More than one parameter instance specifies the same name (regardless of type).
  - The parameter string does not start with a hyphen (-).
  - A parameter instance is not properly defined (name and default value required).
  
## Known Issues
- Currently cannot properly parse a parameter value that contains a hypen other than in the first position.
- Example
    - `-param1 -1234` is valid.
    - `-param2 file-name.txt` is invalid.