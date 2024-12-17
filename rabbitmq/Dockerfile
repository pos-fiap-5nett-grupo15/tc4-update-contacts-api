FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build

WORKDIR /App

COPY ./CreateContact/. ./

RUN dotnet restore  ./UpdateContact.Worker/UpdateContact.Worker.csproj
RUN dotnet build ./UpdateContact.Worker/UpdateContact.Worker.csproj
RUN dotnet publish  ./UpdateContact.Worker/UpdateContact.Worker.csproj -c Release --output Out --no-restore

FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime

WORKDIR /App
COPY --from=build /App/Out/ ./

ENTRYPOINT ["dotnet", "UpdateContact.Worker.dll"]