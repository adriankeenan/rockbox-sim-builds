# rockbox-sim-builds

[Rockbox](https://rockbox.org) [simulator](https://www.rockbox.org/wiki/UiSimulator.html) builds for Linux and Windows, generated via GitHub Actions for various devices.
All the work happens [here](.github/workflows/build.yml).

New simulator builds are produced from the rockbox `master` branch every Sunday at midnight UTC.

## Where are the builds?

Builds are available as assets in the latest [release](../../releases).

## Adding targets

Feel free to create a PR for adding additional targets.

1. Inspect the "Dump target IDs" step from an existing run to get the list of supported targets.
2. Add the target name and ID to [targets.json](.github/targets.json).