FROM mcr.microsoft.com/dotnet/sdk:5.0 AS builder

COPY . .
USER 0

RUN umask 0222 && dotnet build

FROM mcr.microsoft.com/dotnet/aspnet:5.0

COPY --from=builder /App/bin/Debug/net5.0 App/
WORKDIR /App

ENTRYPOINT ["/App/App"]
