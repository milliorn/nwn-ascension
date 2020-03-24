rmdir /s/q src
docker run --rm -it -v $(pwd):/nasher squattingmonk/nasher:latest unpack --file:ascension.mod --yes --removeDeleted