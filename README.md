# Git octopus action

This action starts a build for the triggering repo on the given branch

## Inputs

### `branch`

**Required** The name of the branch. Default `master`.

## Outputs

### `branch`

The branch the build was run on.


## Example usage

```
uses: SonarSource/gh-action_nightly_build@master
env:
  CIRRUS_TOKEN: ${{ secrets.CIRRUS_TOKEN }}
with:
  branch: 'master'
```
