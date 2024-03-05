## Commbase <img align="center" alt="Commbase" width="10%" src="./images/commbase.png" />

# Request-Response API Documentation

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
    {"current_request": "tell me about yourself."},
    {"previous_request": "tell me about yourself."},
    {"current_response": ""},
    {"runtime": ""},
    {"source_code": ""}
  ]
}
```

### Example Response Object:

Note: The response object represents a single updated object.

```json
{
  "messages": [
    {"control": ""},
    {"current_request": "tell me about yourself."},
    {"previous_request": "tell me about yourself."},
    {"current_response": "Here is information about myself."},
    {"runtime": "nodejs"},
    {"source_code": "console.log('Line 1\na\nb\nc');\nconsole.log('Line 2');\nconsole.log('Line 3');"}
  ]
}
```

In the client, the script to execute would be:

```js
console.log('Line 1\na\nb\nc');
console.log('Line 2');
console.log('Line 3');
```

... and the code execution would log in the console:

```bash
Line 1
a
b
c
Line 2
Line 3
```

The Bash program that executes the script uses `echo -e` to interpret escape sequences, ensuring that the newline characters in the source code are preserved when saving it to a temporary file for execution.

### Examples in Bash

```json
{
  "messages": [
    {"control": ""},
    {"current_request": "tell me about yourself."},
    {"previous_request": "tell me about yourself."},
    {"current_response": "Here is information about myself."},
    {"runtime": "bash"},
    {"source_code": "echo \"My name is Commbase, I am a ...\"\nsleep 5"}
  ]
}
```

This example uses `sleep` in the script to keep the terminal open a specific period of time in seconds.

```json
{
  "messages": [
    {"control": ""},
    {"current_request": "tell me about yourself."},
    {"previous_request": "tell me about yourself."},
    {"current_response": "Here is information about myself."},
    {"runtime": "bash"},
    {"source_code": "#!/usr/bin/env bash\necho \"My name is Commbase, I am a ...\"\n# Use 'read' to wait for user input\nread -p \"Press Enter to exit\"\necho \"Exiting the script.\""}
  ]
}
```

This example uses `read -p` to do not exit immediately and waits for user input to exit.

```json
{
  "messages": [
    {"control": ""},
    {"current_request": "tell me about yourself."},
    {"previous_request": "tell me about yourself."},
    {"current_response": "Here is information about myself."},
    {"runtime": "bash"},
    {"source_code": "#!/usr/bin/env bash\necho \"My name is Commbase, I am a ...\"\necho \"This script will run indefinitely. Press Ctrl+C to stop it.\"\nwhile true; do\n  sleep 1\ndone"}
  ]
}
```

This example uses a `while loop` with the condition `true`, which is always true, creating an infinite loop. The `sleep 1` statement ensures there's a short delay between iterations to prevent excessive resource usage.

```json
{
  "messages": [
    {"control": ""},
    {"current_request": "tell me about yourself."},
    {"previous_request": "tell me about yourself."},
    {"current_response": "Here is information about myself."},
    {"runtime": "bash"},
    {"source_code": "#!/usr/bin/env bash\n(echo \"My name is Commbase, I am a ...\")\n(firefox)"}
  ]
}
```

This example opens a (graphical) web browser (in the client) using the command `firefox`.

### Example in Python

```json
{
  "messages": [
    {"control": ""},
    {"current_request": "tell me about yourself."},
    {"previous_request": "tell me about yourself."},
    {"current_response": "Here is information about myself."},
    {"runtime": "python"},
    {"source_code": "#!/usr/bin/env bash\nprint(\"My name is Commbase, I am a ...\")\ntime.sleep(5)"}
  ]
}
```

This example pauses the script's execution for 5 seconds using the `time.sleep()` function.
