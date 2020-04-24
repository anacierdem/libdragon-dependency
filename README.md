# Libdragon Dependency

This repository is a template/boilerplate for a libdragon dependency.

Rename these files and related `#include`s to match your library:

    /include/libmain.h
    /src/libmain.c

Also update `LIBRARY_SUFFIX` in `/test/Makefile` and `LIBRARY_NAME` in the root `Makefile`.

## VSCode tasks

There are four basic vscode tasks which map to npm scripts;

**build:** Builds the library to object files via root `Makefile`'s `all` recipe. Installs it with `install` and runs make on `/test` folder to generate a ROM image to test the library _this is the default pre-launch task_

## Travis CI

There is also a Travis configuration to mimic the same build chain on CI.
