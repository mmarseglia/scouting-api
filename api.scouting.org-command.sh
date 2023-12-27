#!/usr/bin/env sh
 
# HTTPie doesnt support defining requests in a dedicated file, but we can still script it
 
CMD="http"
OPTS="--ignore-stdin"
 
"$CMD" "$OPTS" "$OPTIC_PROXY"/advancements/ranks
"$CMD" "$OPTS" "$OPTIC_PROXY"/advancements/ranks\?foo
"$CMD" "$OPTS" "$OPTIC_PROXY"/lookups/address/countries