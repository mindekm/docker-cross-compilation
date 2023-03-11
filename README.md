# ASP.NET Core multi-platform images

This repository describes how to use Docker Buildkit to build multi-platform (AMD64, ARM64) images for an ASP.NET Core project.

Multiple dockerfile build stages are used to create a rudimentary conditional statement. This is due to an unfortunate incompatibility between how docker and dotnet runtime identifiers are represented.
Afterwards, dotnet cross-compilation capabilities are utilized to execute the restore, compile and publish steps natively while only the final copying of build artifacts is running under emulation. This results in a significant build time improvement.

The official Chiseled Ubuntu is used as a base for the resulting image. Since this base image is rootless it is not possible to bind to the port 80 and port 8080 is used instead.

## References

[Faster Multi-Platform Builds: Dockerfile Cross-Compilation Guide](https://www.docker.com/blog/faster-multi-platform-builds-dockerfile-cross-compilation-guide/)

[Creating Docker multi-arch images for ARM64 from Windows](https://andrewlock.net/creating-multi-arch-docker-images-for-arm64-from-windows/)
