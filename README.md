
Recipe to build a standalone binary for borgbackup
===

These scripts use a docker container to build a standalone binary for
borg, without requiring the installation of further dependencies.

To build the binary, simply run:

```
make
```

To remove the docker image and container used during the process:

```
make clean-docker
```

To clean everything:

```
make clean
```
