cmake_minimum_required(VERSION 3.10)
project(cmake_opengl)
#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_BUILD_TYPE Debug)
file(GLOB_RECURSE SOURCES "src/*.h" "src/*.cpp")
find_package (PkgConfig REQUIRED)
find_package (OpenGL REQUIRED)
find_package (glfw3 REQUIRED)
find_package (GLM REQUIRED)
find_package (GLEW REQUIRED STATIC)

include_directories ( include ${OPENGL_INCLUDE_DIR} ${GLFW_INCLUDE_DIRS})

include_directories(/usr/local/include)
find_library(COCOA_LIBRARY Cocoa REQUIRED)
find_library(IOKIT_LIBRARY IOKit REQUIRED)
find_library(COREVID_LIBRARY CoreVideo REQUIRED)

add_executable(ogl ${SOURCES})
  target_link_libraries (ogl
          glfw
          ${OPENGL_LIBRARIES}
          ${GLEW_LIBRARY}
          ${COCOA_LIBRARY} ${COREVID_LIBRARY} ${IOKIT_LIBRARY})

file(COPY ${CMAKE_CURRENT_SOURCE_DIR}/res/lamp.fs DESTINATION ${CMAKE_CURRENT_BINARY_DIR}/res)
file(COPY ${CMAKE_CURRENT_SOURCE_DIR}/res/lamp.vs DESTINATION ${CMAKE_CURRENT_BINARY_DIR}/res)
file(COPY ${CMAKE_CURRENT_SOURCE_DIR}/res/lighting.fs DESTINATION ${CMAKE_CURRENT_BINARY_DIR}/res)
file(COPY ${CMAKE_CURRENT_SOURCE_DIR}/res/lighting.vs DESTINATION ${CMAKE_CURRENT_BINARY_DIR}/res)
