#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-buster-slim AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/core/sdk:3.1-buster AS build
WORKDIR /src
COPY ["SigmaTraining0/SigmaTraining0.csproj", "SigmaTraining0/"]
RUN dotnet restore "SigmaTraining0/SigmaTraining0.csproj"
COPY . .
WORKDIR "/src/SigmaTraining0"
RUN dotnet build "SigmaTraining0.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "SigmaTraining0.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "SigmaTraining0.dll"]