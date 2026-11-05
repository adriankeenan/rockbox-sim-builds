# rockbox-sim-builds

[Rockbox](https://rockbox.org) [simulator](https://www.rockbox.org/wiki/UiSimulator.html) builds for Linux, Windows and macOS (Apple Silicon), generated via GitHub Actions for various targets.
The workflow is defined [here](.github/workflows/build.yml).

New simulator builds are produced from the rockbox `master` branch daily at midnight UTC.

**Binaries available as assets in the latest [release](../../releases/tag/rb-master).**

### macOS

macOS builds are for Apple Silicon (arm64) only. The minimum supported macOS version is printed in the "Verify binaries" step of the build job (expected to be macOS 15 or later, as SDL2 is linked from Homebrew).

The binaries are unsigned, so macOS will block them after download. Remove the quarantine flag before running:

```sh
xattr -dr com.apple.quarantine <extracted folder>
```

## Adding targets

Feel free to create a PR for adding additional targets.

1. Inspect the boostrap "Dump available targets" step from an existing [run](../../actions?query=branch%3Amain) to get the list of supported targets.
2. Add the target name and ID to [targets.json](.github/targets.json).