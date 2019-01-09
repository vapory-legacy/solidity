function(create_build_info NAME)

	# Set build platform; to be written to BuildInfo.h
	set(VAP_BUILD_OS "${CMAKE_SYSTEM_NAME}")

	if (CMAKE_COMPILER_IS_MINGW)
		set(VAP_BUILD_COMPILER "mingw")
	elseif (CMAKE_COMPILER_IS_MSYS)
		set(VAP_BUILD_COMPILER "msys")
	elseif (CMAKE_COMPILER_IS_GNUCXX)
		set(VAP_BUILD_COMPILER "g++")
	elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "MSVC")
		set(VAP_BUILD_COMPILER "msvc")
	elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
		set(VAP_BUILD_COMPILER "clang")
	elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "AppleClang")
		set(VAP_BUILD_COMPILER "appleclang")
	else ()
		set(VAP_BUILD_COMPILER "unknown")
	endif ()

	set(VAP_BUILD_PLATFORM "${VAP_BUILD_OS}.${VAP_BUILD_COMPILER}")

	#cmake build type may be not speCified when using msvc
	if (CMAKE_BUILD_TYPE)
		set(_cmake_build_type ${CMAKE_BUILD_TYPE})
	else()
		set(_cmake_build_type "${CMAKE_CFG_INTDIR}")
	endif()

	# Generate header file containing useful build information
	add_custom_target(${NAME}_BuildInfo.h ALL
		WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
		COMMAND ${CMAKE_COMMAND} -DVAP_SOURCE_DIR="${PROJECT_SOURCE_DIR}" -DVAP_BUILDINFO_IN="${VAP_CMAKE_DIR}/templates/BuildInfo.h.in" -DVAP_DST_DIR="${PROJECT_BINARY_DIR}/include/${PROJECT_NAME}" -DVAP_CMAKE_DIR="${VAP_CMAKE_DIR}"
		-DVAP_BUILD_TYPE="${_cmake_build_type}"
		-DVAP_BUILD_OS="${VAP_BUILD_OS}"
		-DVAP_BUILD_COMPILER="${VAP_BUILD_COMPILER}"
		-DVAP_BUILD_PLATFORM="${VAP_BUILD_PLATFORM}"
		-DPROJECT_VERSION="${PROJECT_VERSION}"
		-P "${VAP_SCRIPTS_DIR}/buildinfo.cmake"
		)
	include_directories("${PROJECT_BINARY_DIR}/include")
endfunction()
