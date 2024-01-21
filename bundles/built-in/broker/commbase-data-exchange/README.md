# commbase-data-exchange

commbase-data-exchange is an application for exchanging JSON data over HTTP and WebSocket connections, allowing clients to save and retrieve JSON data in real-time.

Its client component fetches initial data from the server component through HTTP and receives real-time updates via WebSocket, specifically handling the 'update_saved_data' event.

When the client receives a Commbase application message from the user, it sends it to the server for processing. The server manages to process the message, and when receives the processing result, it sends it to the client. Finally, the client executes the result. Results can be any type of discourse, skills, skillsets, or any of their combinations.

## Empowering Localhost Applications

The commbase-data-exchange single-server single-client design provides the capabilities of Centralized Control and Management, and Scalability to localhost-based applications.
