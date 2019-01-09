#!/usr/bin/env sh

set -e

docker login -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD";
version=$($(dirname "$0")/get_version.sh)
if [ "$TRAVIS_BRANCH" = "develop" ]
then
    docker tag vapory/solc:build vapory/solc:nightly;
    docker tag vapory/solc:build vapory/solc:nightly-"$version"-"$TRAVIS_COMMIT"
    docker push vapory/solc:nightly-"$version"-"$TRAVIS_COMMIT";
    docker push vapory/solc:nightly;
elif [ "$TRAVIS_TAG" = v"$version" ]
then
    docker tag vapory/solc:build vapory/solc:stable;
    docker tag vapory/solc:build vapory/solc:"$version";
    docker push vapory/solc:stable;
    docker push vapory/solc:"$version";
else
    echo "Not publishing docker image from branch $TRAVIS_BRANCH or tag $TRAVIS_TAG"
fi
