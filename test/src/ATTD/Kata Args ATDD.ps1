Feature 'Kata Args' {
    Scenario 0001 'Parameter has negative value' {
    Given 'A numeric parameter' 
    Given 'Parameter has a value less than zero' 
    When 'Parse parameters' 
    Then 'Only 1 parameter key' 
    Then 'Parameter value is negavtive' }

    Scenario 0002 'Parameters passed in order not matching schema' {
    Given 'Parameter string not in same order as schema defined' 
    When 'Parse parameters' 
    Then 'Parameters are parsed correctly' }
    
    Scenario 0003 'Parameter default values' {
    Given 'Parameter string with missing keys' 
    When 'Parse parameters' 
    Then 'Missing parameters has default values' }
}