# BSA Scouting API

This attempts to document the APIs of the Boy Scouts of America.

## Table of Contents

- [Introduction](#introduction)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Introduction

The Boy Scouts of America has APIs used by their applications. Those APIs are documented here in the hopes that
volunteers can find creative uses to better serve Scouting.

This project documents the APIs using the [OpenAPI specification](https://spec.openapis.org/oas/latest.html).

- OpenAPI specification
- OpenAPI specification testing, using [Optic](https://www.useoptic.com)
- [Postman](http://postman.com) collection

## Installation

You will need [NodeJS](https://nodejs.org/) to validate the API. Otherwise, your favorite editor or OpenAPI tool will do.

## Usage

### View the API documentation

Point your favorite [OpenAPI](https://www.openapis.org) tool at the `openapi.yaml` file in the API's directory.

### Validate the API

The tests are run using [Optic](https://www.useoptic.com). The test checks the API response against the specification.

1. npm install
1. npm test

### Postman Collection

You can use Postman to easily make API calls. Download Postman and you can find the collection [here](https://app.getpostman.com/run-collection/1018039-7ec2af3f-c36a-489c-9e6a-9dc3be66a508?action=collection%2Ffork&source=rip_markdown&collection-url=entityId%3D1018039-7ec2af3f-c36a-489c-9e6a-9dc3be66a508%26entityType%3Dcollection%26workspaceId%3De4113f38-1f4e-4639-b1ac-96d14dd279f3)

A backup of the collection is stored in the `postman` directory.

## Contributing

Just open a pull request if you'd like to contribute.

## License

Apache License version 2.0
