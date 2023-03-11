COMMIT_HASH=$(git log --pretty=format:%h -n 1)

docker buildx build -f Dockerfile --platform linux/arm64,linux/amd64 -t mindekm/aspnetcore-crosscompilation:${COMMIT_HASH} -t mindekm/aspnetcore-crosscompilation:latest --build-arg "PRODUCT_VERSION=1.0.0+${COMMIT_HASH}" --push .
