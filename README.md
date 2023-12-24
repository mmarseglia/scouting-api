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

## Installation

You will need [NodeJS](https://nodejs.org/) to validate the API. Otherwise, your favorite editor or OpenAPI tool will do.

## Usage

### View the API documentation

- Point your favorite [OpenAPI](https://www.openapis.org) tool at the `openapi.yaml` file in the API's directory.

### Validate the API

The tests are run using [Optic](https://www.useoptic.com). The test checks the API response against the specification.

1. npm install
1. npm test

## Contributing

Just open a pull request if you'd like to contribute.

## License

Apache License version 2.0
