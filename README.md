# git-hooks
A collection of git-hooks to be shared across multiple repositories.

# hooks

## pre-push
This performs a number of optional steps before pushing code to a repository.
The options are controlled by flags that are set in your local git configuration.

### flags.run-tests
If true will run the `run-dotnet-tests.sh` script.

# sub programs
These are small scripts that are called by the various hooks.

## run-dotnet-tests
This runs dotnet tests for a given solution.

### hook-vars.test-solution-directory
The absolute path to the directory that stores either:
- the solution directory that contains one or more test projects
- the project directory for a test project