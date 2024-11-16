#!/bin/sh

solution_directory=$(git config hook-vars.test-solution-directory)

# runs tests and pushes package before pushing
if [ -z "$solution_directory" ]; then
	echo "[run-dotnet-tests] ERROR: Missing git config variable 'hook-vars.test-solution-directory'. 
	Please set this variable in your local git configuration."
	exit 3;
fi
echo "[Pre Merge] OPERATION: Running solution tests..."
dotnet test $solution_directory --nologo -v m

if [ $? -ne 0 ]; then
    echo "[run-dotnet-tests] ERROR: Will not push due to failing tests."
    exit 1;
fi

echo "[run-dotnet-tests] Complete!"