[![Python Package using Conda](https://github.com/mydroidandi/commbase/actions/workflows/python-package-conda.yml/badge.svg)](https://github.com/mydroidandi/commbase/actions/workflows/python-package-conda.yml)
[![Python Version](https://img.shields.io/badge/Python-3.10%20%7C%203.11%20%7C%203.12-blue)](https://img.shields.io/badge/python-3.10%20%7C%203.11%20%7C%203.12-blue)

# commbase-data-exchange

<img alt="commbase-data-exchange" src="commbase-data-exchange.jpg?raw=true" width="512" height="512" />

commbase-data-exchange is an application for exchanging JSON data over HTTP and WebSocket connections, allowing clients to save and retrieve JSON data in real-time.

## Data Exchange Operating

Its client component fetches initial data from the server component through HTTP and receives real-time updates via WebSocket, specifically handling the 'update_saved_data' event.

When the client receives a Commbase application message from the user, it sends the message to the server for processing. The server manages to process the message, and upon receiving the processing result, it sends it back to the client. Finally, the client executes the result. Results can encompass various types of Commbase commands.

The server component can be executed in one host and the client component can be executed in another host.

## Empowering Localhost Applications

The commbase-data-exchange single-server single-client design provides the capabilities of Centralized Control and Management, and Scalability to standalone applications.

## Examples

Detailed information about examples can be found in the corresponding [`examples`](./examples) directory.

## Contributors

Thanks to the following people who have contributed to this project:

* [@estebanways](https://github.com/estebanways)

## Contact

If you want to contact us you can reach us at <stv.herrera@gmail.com>.

## License

This project uses the following license: [`License`](./COPYING).
