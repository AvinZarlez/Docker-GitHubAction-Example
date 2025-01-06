# Use a multi-architecture base image
FROM --platform=${TARGETPLATFORM} ubuntu:24.04
CMD ["echo", "Hello World!"]