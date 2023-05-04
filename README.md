# gh-action_nightly_build (no longer maintained)

> WARN
> This action is no longer maintained. The repo will be archived.
> Please use cirrus-ci cron feature as a replacement: [Cirrus Cron documentation](https://cirrus-ci.org/guide/writing-tasks/#cron-builds)

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
