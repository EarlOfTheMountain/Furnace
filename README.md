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

### Configure, build, and run

From the repository root:

```sh
cmake cpp -B build
cmake --build build
./build/FurnaceXX
```
