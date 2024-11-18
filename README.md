# git-hooks
A collection of git-hooks to be shared across multiple repositories.

# usage
- clone this repo
- navigate to the local git repo you want to use these hooks
- update your local git config to point its hooks to this repository's location
-- see https://git-scm.com/docs/git-config#Documentation/git-config.txt-corehooksPath
- update your local git config to include values for the hook variables you intend to use (see below)


# hooks

## pre-push
This performs a number of optional steps before pushing code to a repository.
The options are controlled by flags that are set in your local git configuration.

### `flags.run-tests`
A git config variable. If true will run the `run-dotnet-tests.sh` script.

### `flags.extract-version`
A git config variable. If true will run the `extract-dotnet-project-version` script.

### `flags.push-to-nuget`
A git config variable. If true will run the `nuget-push` script. Requires the `flags.extract-version` flag to be true.

# sub programs
These are small scripts that are called by the various hooks.

## run-dotnet-tests
This runs dotnet tests for a given solution.

### `hook-vars.test-solution-directory`
A git config variable. The absolute path to the directory that stores either:
- the solution directory that contains one or more test projects
- the project directory for a test project

## extract-dotnet-project-version
This retrieves a version number from a csharp project file.

### `hook-vars.version-project-file`
A git config variable. The absolute path that points to the project file to extract its version.

## nuget-push
Pushes a compiled csharp project's nuget package to a package repository

### `hook-vars.nuget-address`
A git config variable. The address of the nuget repository.

### `hook-vars.nuget-api-key`
A git config variable. The api key required to push to the nuget repository.

### `hook-vars.package-file-path`
A git config variable. The absolute path to the nuget package including it's name, but without the `.version.nupkg` suffix.

### $1
The first argument provided into the script. The version number of the package being uploaded.
