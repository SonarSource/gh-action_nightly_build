#!/bin/bash
set -e
set -o pipefail

BRANCH=$1
OWNER=${GITHUB_REPOSITORY%*/*}
REPO=${GITHUB_REPOSITORY#*/}


REPOSITORY_ID=`curl -s -H "Authorization: Bearer $CIRRUS_TOKEN" \
-H "Content-Type: application/json" https://api.cirrus-ci.com/graphql \
-X POST --data '{"query":"query GitHubRepositoryQuery {githubRepository(owner:\"'$OWNER'\",name:\"'$REPO'\"){id}}"}' | jq -r .data.githubRepository.id`

echo "running nightly build on $BRANCH for $OWNER $REPO id:$REPOSITORY_ID"

curl -s -H "Authorization: Bearer $CIRRUS_TOKEN" \
-H "Content-Type: application/json" https://api.cirrus-ci.com/graphql \
-X POST --data '{"query": "mutation CreateBuildDialogMutation($input: RepositoryCreateBuildInput!) {createBuild(input: $input) {build {id}}}","variables": {"input": {"clientMutationId": "'$REPO'","repositoryId": '$REPOSITORY_ID',"branch": "'$BRANCH'","sha": "","configOverride": ""}}}'

echo ::set-output name=branch::$1
