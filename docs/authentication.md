
# Authentication and Authorization

Describes authentication and authorization.

## Obtaining a JWT Token

- Log into Scoutbook or Internet Advancement
- Open your browser's Web Developer Console
- Look at the Network tab and find a HTTP request to api.scouting.org
- Look at the request headers and find the Authorization header
- Copy the token
- Update the variable `TOKEN` in the config file `config.sh`.

## JWT Token Schema

See [jwt-token-schema.json](jwt-token-schema.json)