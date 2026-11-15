# Furnace

## Linux build

The C++ application is built with CMake from the repository root. You need CMake, a C++ compiler and the development packages for SDL2, SDL2_image, GLEW, GLM, and OpenGL.

> **Note:** The current `cpp/CMakeLists.txt` also requires SDL2_mixer through `pkg-config`. Install its development package as shown below, even though the application dependency list above does not otherwise mention SDL2_mixer.

### Debian and Ubuntu

```sh
sudo apt update
sudo apt install build-essential cmake pkg-config libgl1-mesa-dev \
  libsdl2-dev libsdl2-image-dev libsdl2-mixer-dev libglew-dev libglm-dev
```

### Arch Linux

```sh
sudo pacman -Syu
sudo pacman -S base-devel cmake pkgconf mesa \
  sdl2 sdl2_image sdl2_mixer glew glm
```

### openSUSE

```sh
sudo zypper refresh
sudo zypper install gcc gcc-c++ make cmake pkg-config Mesa-libGL-devel \
  libSDL2-devel libSDL2_image-devel libSDL2_mixer-devel glew-devel glm-devel
```

### Fedora

```sh
sudo dnf install @development-tools cmake pkgconf-pkg-config mesa-libGL-devel \
  SDL2-devel SDL2_image-devel SDL2_mixer-devel glew-devel glm-devel
```

## BSD build

The BSD builds use `pkg-config` to locate SDL2, SDL2_image, SDL2_mixer, and GLEW. Install the packages and make sure a C++ toolchain and OpenGL development libraries are available for your system. Package names can vary by release; use the distribution's package search if a name is not recognized.

### FreeBSD

FreeBSD's base system provides Clang and make. Install the libraries and build tools with `pkg`:

```sh
sudo pkg install cmake pkgconf sdl2 sdl2_image sdl2_mixer glew glm mesa-libs
```

### OpenBSD

OpenBSD includes a C/C++ toolchain and make in the base system. Install CMake and the dependencies with `pkg_add`:

```sh
doas pkg_add cmake pkgconf sdl2 sdl2_image sdl2_mixer glew glm
```

### NetBSD

Use an installed C/C++ toolchain and `pkgin` (or install the equivalent packages from pkgsrc):

```sh
sudo pkgin install cmake pkgconf SDL2 SDL2_image SDL2_mixer glew glm
```

If `pkg-config` cannot find the installed `.pc` files, check the package manager's pkg-config search path. On FreeBSD, this is commonly `/usr/local/libdata/pkgconfig`; pkgsrc installations commonly use `/usr/pkg/lib/pkgconfig`.

## Configure, build, and run

From the repository root on Linux or BSD:

```sh
cmake cpp -B build
cmake --build build
./build/FurnaceXX
```
