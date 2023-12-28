#!/usr/bin/env bash

# shellcheck disable=SC1091
source config.sh

# HTTPie doesnt support defining requests in a dedicated file, but we can still script it

CMD="http"
OPTS="--ignore-stdin"
 
# advancements/ranks
## get all ranks as a JSON object
"$CMD" "$OPTS" "$OPTIC_PROXY"/advancements/ranks

## ranks invalid parameter
"$CMD" "$OPTS" "$OPTIC_PROXY"/advancements/ranks\?foo

# advancements/youth
## authorization failure
"$CMD" "$OPTS" "$OPTIC_PROXY"/advancements/youth/123457890/

## not found
"$CMD" "$OPTS" "${OPTIC_PROXY}/advancements/youth/${userId}/" "Authorization: Bearer ${TOKEN}"

## method not allowed
"$CMD" "$OPTS" "${OPTIC_PROXY}/advancements/youth/${userId}" "Authorization: Bearer ${TOKEN}"

## leadership history
"$CMD" "$OPTS" "${OPTIC_PROXY}/advancements/youth/${userId}/leadershipPositionHistory" "Authorization: Bearer ${TOKEN}"

# data lookups
## get all countries as a JSON object
"$CMD" "$OPTS" "$OPTIC_PROXY"/lookups/address/countries

