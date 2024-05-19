cmake_minimum_required(VERSION 3.20)

project(building-libcurl-with-example)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_BUILD_TYPE Release)

include_directories(
    ${CMAKE_SOURCE_DIR}/curl-8.5.0/include
)

set(CLIENT_MAIN_SRC
    ${CMAKE_SOURCE_DIR}/src/main.cpp
)

add_executable(client
    ${CLIENT_MAIN_SRC}
)

target_link_libraries(client
    ${CMAKE_SOURCE_DIR}/curl-8.5.0/lib/.libs/libcurl.a
    ssl
    crypto
)