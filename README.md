# git-hooks
A collection of git-hooks to be shared across multiple repositories.

# hooks

## pre-push
This performs a number of optional steps before pushing code to a repository.
The options are controlled by flags that are set in your local git configuration.

### flags.run-tests
If true will run the `run-dotnet-tests.sh` script.

### flags.extract-version
If true will run the `extract-dotnet-project-version` script.

# sub programs
These are small scripts that are called by the various hooks.

## run-dotnet-tests
This runs dotnet tests for a given solution.

### hook-vars.test-solution-directory
The absolute path to the directory that stores either:
- the solution directory that contains one or more test projects
- the project directory for a test project

## extract-dotnet-project-version
This retrieves a version number from a csharp project file.

### hook-vars.version-project-file
The absolute path that points to the project file to extract its version.

# todo
-[ ] extract nuget package upload
-[ ] write instructions on how to bind hooks to another git repository