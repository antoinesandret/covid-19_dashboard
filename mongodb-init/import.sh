#!/bin/bash

find ./data -name '*.csv' -exec sh -c ' \
   file={}; \
   collection_name="$(basename "$(dirname "$file")")"; \
   fields=$(head -n 1 "$file" | sed -e "s/,/\",\"/g"); \
   mongoimport --host localhost --db covidb --collection "$collection_name" --type csv --headerline --file "$file"; \
' \;