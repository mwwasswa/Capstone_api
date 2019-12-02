#!/bin/bash

curl "http://localhost:4741/blogs/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "blog": {
      "category": "'"${CATEGORY}"'",
      "title": "'"${TITLE}"'",
      "content": "'"${CONTENT}"'",
      "user_id": "'"${ID}"'"
    }
  }'

echo
