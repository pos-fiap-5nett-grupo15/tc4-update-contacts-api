FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build

WORKDIR /App

COPY ./UpdateContact/. ./

RUN dotnet restore  ./UpdateContact.Api/UpdateContact.Api.csproj
RUN dotnet build ./UpdateContact.Api/UpdateContact.Api.csproj
RUN dotnet publish  ./UpdateContact.Api/UpdateContact.Api.csproj -c Release --output Out --no-restore

FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime

WORKDIR /App
COPY --from=build /App/Out/ ./

ENTRYPOINT ["dotnet", "UpdateContact.Api.dll"]