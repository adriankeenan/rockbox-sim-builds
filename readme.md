# rockbox-sim-builds

[Rockbox](https://rockbox.org) [simulator](https://www.rockbox.org/wiki/UiSimulator.html) builds for Linux, Windows and macOS, generated via GitHub Actions for various targets.
The workflow is defined [here](.github/workflows/build.yml).

New simulator builds are produced from the rockbox `master` branch daily at midnight UTC.

**Binaries available as assets in the latest [release](../../releases/tag/rb-master).**

## Adding targets

Feel free to create a PR for adding additional targets.

1. Inspect the boostrap "Dump available targets" step from an existing [run](../../actions?query=branch%3Amain) to get the list of supported targets.
2. Add the target name and ID to [targets.json](.github/targets.json).