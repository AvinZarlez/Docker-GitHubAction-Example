# Use a multi-architecture base image
FROM --platform=${BUILDPLATFORM} ubuntu:24.04
CMD ["echo", "Hello World!"]