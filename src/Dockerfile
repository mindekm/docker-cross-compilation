ARG RID

FROM --platform=${BUILDPLATFORM} mcr.microsoft.com/dotnet/sdk:7.0 AS build-base

FROM build-base AS build-arm64
ARG RID="linux-arm64"

FROM build-base AS build-amd64
ARG RID="linux-x64"

FROM build-${TARGETARCH} as build-final
ENV DOTNET_CLI_TELEMENTRY_OPTOUT 1
ARG PRODUCT_VERSION
WORKDIR /src
COPY ["WebApi/WebApi.csproj", "WebApi/"]
RUN dotnet restore "WebApi/WebApi.csproj" --runtime=${RID}
COPY . .
RUN dotnet publish "WebApi/WebApi.csproj" -c Release -o /app/publish -p:UseAppHost=false -p:Version=${PRODUCT_VERSION} --no-restore --runtime=${RID} --no-self-contained -p:PublishReadyToRun=false

FROM mcr.microsoft.com/dotnet/nightly/aspnet:7.0-jammy-chiseled
ENV DOTNET_CLI_TELEMENTRY_OPTOUT 1
WORKDIR /app
COPY --from=build-final /app/publish .
ENTRYPOINT ["dotnet", "WebApi.dll"]
