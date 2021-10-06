# Libdragon Dependency

This repository is a template/boilerplate for a libdragon dependency.

Rename these files and related `#include`s to match your library:

    /include/libmain.h
    /src/libmain.c

Also update `LIBRARY_NAME` in the root `Makefile`.

## VSCode tasks

There is a basic vscode tasks which map to npm scripts;

**build:** Runs the example recipe in the root `Makefile` which will also builds and install the library via the root `install` recipe. This generates an example ROM image to test the library _this is the default pre-launch task_