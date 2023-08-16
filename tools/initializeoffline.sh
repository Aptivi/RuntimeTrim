#!/bin/bash

# Restore packages
echo "- Restoring packages..."
echo "  - HOME=`pwd`/nuget dotnet restore RuntimeTrim.sln"
HOME=`pwd`/nuget dotnet restore RuntimeTrim.sln
if [ "$?" -ne 0 ]; then
	exit $?
fi

# Copy dependencies to deps
echo "- Copying dependencies to deps..."
echo "  - mkdir deps"
mkdir deps
echo "  - cp nuget/.nuget/packages/*/*/*.nupkg ./deps/"
cp nuget/.nuget/packages/*/*/*.nupkg ./deps/
echo "  - rm -r nuget/.nuget/packages"
rm -r nuget/.nuget/packages

# Copy NuGet.config for offline use
echo "- Copying NuGet.config..."
echo "  - cp tools/OfflineNuGet.config ./NuGet.config"
cp tools/OfflineNuGet.config ./NuGet.config

echo "- You should be able to build offline!"

