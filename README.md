# Scouting America API

This attempts to document the APIs of Scouting America.

## Table of Contents

- [Introduction](#introduction)
- [Installation](#installation)
- [Usage](#usage)
- [Setup](#setup)
- [Contributing](#contributing)
- [License](#license)

## Introduction

Scouting America has APIs used by their applications. Those APIs are documented here in the hopes that
volunteers can find creative uses to better serve Scouting.

This project documents the APIs using the [OpenAPI specification](https://spec.openapis.org/oas/latest.html).

- OpenAPI specification
- OpenAPI specification testing, using [Optic](https://www.useoptic.com)
- [Postman](http://postman.com) collection

## Installation

You will need [NodeJS](https://nodejs.org/) to validate the API. Otherwise, your favorite editor or OpenAPI tool will
do. Install the dependencies.

```shell
npm install
```

## Setup

Some API calls require authentication or parameters, such as a user's ID to get a person's Leadership History
`/advancements/youth/${userId}/leadershipPositionHistory`. These are configured as shell variables using the authentication script,
[config.sh](config.sh).

To set up authentication:
1. Source the config.sh script with your my.scouting.org credentials:
   ```shell
   source config.sh <username> <password>
   ```
2. This will automatically set the required environment variables:
   - `userId`: User ID of the person (automatically fetched)
   - `TOKEN`: JWT token for authentication (automatically fetched)

Some tests will fail if you do not set up authentication using the config.sh script.

## Usage

### View the API documentation

Point your favorite [OpenAPI](https://www.openapis.org) tool at the `openapi.yaml` file in the API's directory.

### Validate the API

The tests are run using [Optic](https://www.useoptic.com). The test checks the API response against the specification.

```shell
npm run openapi-test
```

### Update the OpenAPI Specification

1. Write the test case in the test file [api.scouting.org-command.sh](api.scouting.org-command.sh).
1. Run the test command `npm run openapi-test`.
1. Validate the response for the test case.
1. Run the update command `npm run openapi-update`.
1. Optional: Manually modify the updates.
1. Run `npm run openapi-test` to see the updates.

#### Example

Edit the file `api.scouting.org-command.sh`.

```bash
# Get a list of countries
"$CMD" "$OPTS" "$OPTIC_PROXY"/lookups/address/countries
```

```shell
# run the test command and validate the response
npm run openapi-test

> test
> optic capture api.scouting.org/openapi.yaml

{"ranks": [{"id": "1","name": "Scout"
...
"632"},{"name": "Zambia","short": "ZM","id": "633"},{"name": "Zimbabwe","short": "ZW","id": "634"}]
✔ Finished running requests
✔ GET /advancements/ranks
  ✓ 200 response, ✓ 400 response

100.0% coverage of your documented operations. 1 requests did not match a documented path (3 total requests).
New endpoints are only added in interactive mode. Run 'optic capture api.scouting.org/openapi.yaml --update interactive' to add new endpoints
```

```shell
# run the update command, validate, and select "yes" if you want to document the response
npm run openapi-update
...
✔ Finished running requests
✔ GET /advancements/ranks
  ✓ 200 response, ✓ 400 response

Learning path patterns for unmatched requests...
> /lookups/address/countries
✔ Is this the right pattern for GET /lookups/address/countries › yes
Documenting new operations:
✔ GET /lookups/address/countries
```

```shell
# run test again to see the updates
npm run openapi-test
...
✔ Finished running requests
✔ GET /advancements/ranks
  ✓ 200 response, ✓ 400 response
✔ GET /lookups/address/countries
  ✓ 200 response

100.0% coverage of your documented operations. All requests matched a documented path (3 total requests)
```

## Postman Collection

You can use Postman to easily make API calls. Download Postman and you can find the collection [here](https://app.getpostman.com/run-collection/1018039-7ec2af3f-c36a-489c-9e6a-9dc3be66a508?action=collection%2Ffork&source=rip_markdown&collection-url=entityId%3D1018039-7ec2af3f-c36a-489c-9e6a-9dc3be66a508%26entityType%3Dcollection%26workspaceId%3De4113f38-1f4e-4639-b1ac-96d14dd279f3)

A backup of the collection is stored in the `postman` directory.

## Contributing

Just open a pull request if you'd like to contribute.

## License

Apache License version 2.0
