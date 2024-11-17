#!/bin/sh

project_name="extract-dotnet-project-version"

project_file=$(git config hook-vars.version-project-file)
if [ -z "$project_file" ]; then
	echo "[$project_name] ERROR: Missing git config variable 'hook-vars.version-project-file'. 
	Please set this variable in your local git configuration."
	exit 1;
fi

version=$(grep "<Version>" ${project_file} | sed -E 's/.*<Version>([^<]+)<\/Version>.*/\1/')
if [ -z "${version}" ]; then
	echo "[$project_name] ERROR: Failed to extract Version from ${project_file}"
	exit 3;
fi

echo $version