

project_name="nuget-push"
nuget_api_key=$(git config hook-vars.nuget-api-key)
package_path=$(git config hook-vars.package-file-path)
nuget_address=$(git config hook-vars.nuget-address)
version=$1

echo "[$project_name] OPERATION: Retrieving Api Key..."
if [ -z "$nuget_api_key" ]; then
	echo "[$project_name] ERROR: Missing git config variable 'hook-vars.nuget-api-key'."
	exit 1;
fi

echo "[$project_name] OPERATION: Retrieving nuget address..."
if [ -z "$nuget_address" ]; then
	echo "[$project_name] ERROR: Missing git config variable 'hook-vars.nuget-api-key'."
	exit 2;
fi

echo "[$project_name] OPERATION: Retrieving package file path..."
if [ -z "$package_path" ]; then
	echo "[$project_name] ERROR: Missing git config variable 'hook-vars.package-file-path'."
	exit 3;
fi

echo "[$project_name] OPERATION: Retrieving package version..."
if [ -z "$version" ]; then
	echo "[$project_name] ERROR: Missing first parameter. Expected a version number."
	exit 3;
fi

echo "[$project_name] OPERATION: Uploading package"
dotnet nuget push -s $nuget_address ${package_path}.${version}.nupkg --api-key $nuget_api_key
if [ $? -ne 0 ]; then
	echo "[$project_name] ERROR: Will not push due to package upload failing with error code '$?'"
	exit 2;
fi
echo "[$project_name] Complete!"