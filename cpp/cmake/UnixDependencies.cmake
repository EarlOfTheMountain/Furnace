# Dependencies shared by the Unix and BSD build configurations.
# Imported targets preserve pkg-config include paths, library paths, and
# transitive linker flags across systems with different install prefixes.
find_package(PkgConfig REQUIRED)

pkg_check_modules(SDL2 REQUIRED IMPORTED_TARGET sdl2)
pkg_check_modules(SDL2_IMAGE REQUIRED IMPORTED_TARGET SDL2_image>=2.0.0.0)
pkg_check_modules(SDL2_MIXER REQUIRED IMPORTED_TARGET SDL2_mixer)
pkg_check_modules(GLEW REQUIRED IMPORTED_TARGET glew)
