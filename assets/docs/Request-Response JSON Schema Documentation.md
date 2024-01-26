# Commbase <img align="center" alt="Commbase" width="10%" src="./images/commbase.png" /> Client-Server JSON Schema

# Request-Response JSON Schema Documentation

This document provides a detailed explanation of the JSON schema used for communication between the client and server in our application.

## Request Object

The request object is a JSON structure with the following attributes:

1. **control** (string, optional): A control attribute for specific instructions or actions. Currently set to an empty string.

2. **current_request** (string): The request message from the client, indicating the desired information or action. For example, "tell me about yourself."

3. **previous_request** (string): The previous request message from the client. Useful for maintaining context.

4. **current_response** (string, optional): Placeholder for the response message from the server. Currently set to an empty string.

5. **runtime** (string, optional): Specifies the desired runtime or execution environment for the code to be executed by the client.

6. **source_code** (string, optional): Contains the code to be executed by the client.

### Example Request Object:

```json
{
  "messages": [
    {"control": ""},
    {"current_request": "tell me about yourself"},
    {"previous_request": "tell me about yourself"},
    {"current_response": ""},
    {"runtime": ""},
    {"source_code": ""}
  ]
}
```

### Example Response Object:

```json
{
  "messages": [
    {"control": ""},
    {"current_request": "tell me about yourself"},
    {"previous_request": "tell me about yourself"},
    {"current_response": "Here is information about myself"},
    {"runtime": "nodejs"},
    {"source_code": "console.log('Line 1');\nconsole.log('Line 2');\nconsole.log('Line 3');"}
  ]
}
```

Note: The response object represents a single updated object.
