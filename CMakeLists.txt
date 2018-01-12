cmake_minimum_required(VERSION 3.0.2)
project(MyApp)

set (CMAKE_CXX_STANDARD 11)
set (gtest_force_shared_crt ON CACHE BOOL "MSVC defaults to shared CRT" FORCE)

add_subdirectory(thirdparty/googletest/googletest)
target_compile_definitions(gtest PUBLIC GTEST_LANG_CXX11 GTEST_HAS_TR1_TUPLE=0)

# domain library
add_library(mylib "" MyClass.cc)
set_target_properties(mylib PROPERTIES COMPILE_FLAGS "${cxx_strict}")

# text tests
add_executable(app MyTextTests.cc)
set_target_properties(app PROPERTIES COMPILE_FLAGS "${cxx_strict}")
target_link_libraries(app mylib)

# unit tests
add_executable(my_tests MyUnitTests.cc)
set_target_properties(my_tests PROPERTIES COMPILE_FLAGS "${cxx_strict}")
target_link_libraries(my_tests mylib gtest gtest_main)
add_test(my_tests my_tests)
