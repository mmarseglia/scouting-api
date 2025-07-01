# Authentication and Authorization

Describes authentication and authorization.

## Obtaining a JWT Token

There are two ways to obtain a JWT token:

### Automatic Method (Recommended)
Use the `config.sh` script which automatically fetches the token:
```shell
export SCOUT_USERNAME=<username>
export SCOUT_PASSWORD=<password>
source config.sh
```

### Manual Method
If you need to manually obtain a token:
1. Log into Scoutbook or Internet Advancement
2. Open your browser's Web Developer Console
3. Look at the Network tab and find a HTTP request to api.scouting.org
4. Look at the request headers and find the Authorization header
5. Copy the token
6. Set it as an environment variable:
   ```shell
   export TOKEN="your-token-here"
   ```

## JWT Token Schema

See [jwt-token-schema.json](jwt-token-schema.json)