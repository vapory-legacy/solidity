file(GLOB sources "*.cpp")
file(GLOB headers "*.h")

add_library(vvmasm ${sources} ${headers})
target_link_libraries(vvmasm PUBLIC jsoncpp devcore)
