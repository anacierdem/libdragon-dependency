# Libdragon Dependency

This repository is a template/boilerplate for a libdragon dependency.

Rename these files and related `#include`s to match your library:

    /include/libmain.h
    /src/libmain.c

Also update `LIBRARY_SUFFIX` in `/test/Makefile` and `LIBRARY_NAME` in the root `Makefile`.

## VSCode tasks

There are four basic vscode tasks which map to npm scripts;

**buildLib:** Builds the library to object files via root `Makefile`'s `all` recipe.

**installLib:** Installs the library via root `Makefile`'s `install` recipe.

**buildTest:** Runs make on `/test` folder and generates a ROM image to test the library.

**build:** Runs `buildTest` which depends on `buildLib` and `installLib`. *this is the default pre-launch task*

## Travis CI

There is also a Travis configuration to mimic the same build chain on CI.
