#!/bin/bash

repo=$1
release_version=$2
token=$3

echo "Checking release version ${release_version} exists or not."

exists=$(
    curl -s \
        -H "Accept: application/vnd.github+json" \
        -H "Authorization: Bearer ${token}" \
        https://api.github.com/repos/${repo}/releases/tags/${release_version} |
        jq 'has("id")'
)

if [[ "$exists" == true ]]; then
    echo "Release ${release_version} already exists."
    echo "release_exists=true" >>"$GITHUB_OUTPUT"
else
    echo "release_exists=false" >>"$GITHUB_OUTPUT"

fi
