cmake_minimum_required(VERSION 3.8)

project(Boiler VERSION 1.0 LANGUAGES C)

file(GLOB SOURCES
    "${PROJECT_SOURCE_DIR}/*.c"
)

find_package(OpenGL REQUIRED)

if (WIN32)
    set(SDL2_INCLUDE_DIRS
        "${PROJECT_SOURCE_DIR}/../external/SDL2-2.0.12"
        "${PROJECT_SOURCE_DIR}/../external/SDL2-2.0.12/SDL2"
    )
    set(SDL2_IMAGE_INCLUDE_DIRS "${PROJECT_SOURCE_DIR}/../external/SDL2_image-2.0.5")

    # Support both 32- and 64-bit builds.
    if (CMAKE_SIZEOF_VOID_P EQUAL 8)
        set(SDL2_LIBRARIES
            "${PROJECT_SOURCE_DIR}/../external/SDL2-2.0.12/lib/x64/SDL2.lib"
            "${PROJECT_SOURCE_DIR}/../external/SDL2-2.0.12/lib/x64/SDL2main.lib"
        )
        set(SDL2_IMAGE_LIBRARIES "${PROJECT_SOURCE_DIR}/../external/SDL2_image-2.0.5/lib/x64/SDL2_image.lib")
        set(SDL2_MIXER_LIBRARIES "${PROJECT_SOURCE_DIR}/../external/SDL2_mixer-2.0.4/lib/x64/SDL2_mixer.lib")
    else ()
        set(SDL2_LIBRARIES
            "${PROJECT_SOURCE_DIR}/../external/SDL2-2.0.12/lib/x86/SDL2.lib"
            "${PROJECT_SOURCE_DIR}/../external/SDL2-2.0.12/lib/x86/SDL2main.lib"
        )
        set(SDL2_IMAGE_LIBRARIES "${PROJECT_SOURCE_DIR}/../external/SDL2_image-2.0.5/lib/x86/SDL2_image.lib")
        set(SDL2_MIXER_LIBRARIES "${PROJECT_SOURCE_DIR}/../external/SDL2_mixer-2.0.4/lib/x86/SDL2_mixer.lib")
    endif ()

    set(SDL2_INCLUDE_DIRS ${SDL2_INCLUDE_DIRS} "${PROJECT_SOURCE_DIR}/../external/SDL2_image-2.0.5")
elseif (UNIX)
    # Use pkg-config so Unix and BSD builds get the right include and link flags.
    find_package(PkgConfig REQUIRED)
    pkg_check_modules(SDL2 REQUIRED IMPORTED_TARGET sdl2)
    pkg_check_modules(SDL2_IMAGE REQUIRED IMPORTED_TARGET SDL2_image>=2.0.0.0)
    pkg_check_modules(SDL2_MIXER REQUIRED IMPORTED_TARGET SDL2_mixer)
    set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
else ()
    message(FATAL_ERROR "Unsupported platform: ${CMAKE_SYSTEM_NAME}")
endif ()

add_executable(Boiler ${SOURCES})
target_compile_features(Boiler PRIVATE c_std_99)
target_include_directories(Boiler PRIVATE "${PROJECT_SOURCE_DIR}/../include")

if (WIN32)
    target_include_directories(Boiler PRIVATE ${SDL2_INCLUDE_DIRS})
    target_link_libraries(Boiler PRIVATE
        ${SDL2_LIBRARIES}
        ${SDL2_IMAGE_LIBRARIES}
        ${SDL2_MIXER_LIBRARIES}
        ${OPENGL_LIBRARIES}
    )
else ()
    target_link_libraries(Boiler PRIVATE
        PkgConfig::SDL2
        PkgConfig::SDL2_IMAGE
        PkgConfig::SDL2_MIXER
        OpenGL::GL
    )
endif ()
