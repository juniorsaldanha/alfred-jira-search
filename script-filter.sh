#!/bin/bash
# BASEURL TO REQUEST
baseurl="https://${domain}.atlassian.net/rest/api/3/issue/picker?query=${1}"

curl "${baseurl}" \
  --user "${username}:${apitoken}" \
  --header "Accept: application/json" \
  | /usr/local/bin/jq '.sections[0].issues | map({uid: .id, title: .key, subtitle: .summaryText, arg: .key }) | { items: . }'