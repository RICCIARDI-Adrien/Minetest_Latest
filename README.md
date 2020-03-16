# Minetest latest

A simple makefile to download and build latest version of Minetest and some carefully-selected mods on Linux.

## First Minetest build

Make sure you installed all needed build prerequisites. Check them on [official Minetest page](https://github.com/minetest/minetest/blob/master/README.md#compiling-on-gnulinux).

Then, retrieve Minetest and mods source code :
```
make download
```

Build everything :
```
make build
```

Minetest executable is `minetest/bin/minetest`.

## Other builds

Update source code to latest version :
```
make update
```

Build changes :
```
make build
```

Minetest executable is still `minetest/bin/minetest`.
