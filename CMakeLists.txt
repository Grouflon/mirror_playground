cmake_minimum_required(VERSION 3.2)

project(mirror_playground)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED True)

#set(CMAKE_CONFIGURATION_TYPES "Debug;Release" CACHE STRING "" FORCE)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/bin)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/lib)

#find_package(OpenGL REQUIRED)
find_package(MIRROR REQUIRED HINTS "./extern/mirror")

file(GLOB MIRROR_PLAYGROUND_SRC "./src/*.h" "./src/*.cpp")
file(GLOB IMGUI_SRC "./extern/imgui/*.h" "./extern/imgui/*.cpp")

add_compile_definitions(
	_CRT_SECURE_NO_WARNINGS
)

set(SOURCES
	${MIRROR_PLAYGROUND_SRC}
	${IMGUI_SRC}
	${MIRROR_SOURCES}
	${MIRROR_INCLUDE_DIRS}
	extern/imgui/examples/imgui_impl_dx9.cpp
	extern/imgui/examples/imgui_impl_win32.cpp
)

include_directories(
	./src/
	./extern/imgui/
	${MIRROR_INCLUDE_DIRS}
)

add_executable(mirror_playground "./src/main" ${SOURCES})

target_link_libraries(mirror_playground d3d9.lib) 
