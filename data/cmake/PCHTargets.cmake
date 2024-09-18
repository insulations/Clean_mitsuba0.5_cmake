# - Create libraries and executables using a common precompiled header (PCH.)
# 
# This module provides PCH versions of add_library and add_executable,
# for GCC and MSVC and Clang. It depends on the module "CMakeParseArguments",
# introduced in CMake 2.8.3
#
# The module defines the global variable:
#   PCH_SUPPORTED - If true, it is safe to use the other macros in the module.
#
# The main user functions provided behave as the standard add_executable() and
# add_library() functions, except that they specify a common PCH file.
#
#  pch_add_executable(name [WIN32] [MACOSX_BUNDLE]
#                  [EXCLUDE_FROM_ALL]
#                  PCH_HEADER <header>
#                  source1 source2 ... sourceN)
#
#  pch_add_library(name [SHARED | MODULE | STATIC]
#                  [EXCLUDE_FROM_ALL]
#                  PCH_HEADER <header>
#                  source1 source2 ... sourceN)
#
#=============================================================================
# Edgar Vel�zquez-Armend�riz, Cornell University (cs.cornell.edu - eva5)
# Distributed under the OSI-approved MIT License (the "License")
# 
# Copyright (c) 2011 Program of Computer Graphics, Cornell University
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
#=============================================================================

include (CMakeParseArguments)

set (PCH_MSVC  FALSE)
set (PCH_GCC   FALSE)
set (PCH_CLANG FALSE)

# Close PCH
# if (MSVC OR (WIN32 AND CMAKE_CXX_COMPILER_ID MATCHES "Intel"))
#   set (PCH_MSVC  TRUE)
# elseif (CMAKE_CXX_COMPILER_ID MATCHES "Clang")
#   set (PCH_CLANG TRUE)
# elseif (CMAKE_CXX_COMPILER_ID MATCHES "GNU")
#   set (PCH_GCC   TRUE)
# elseif (NOT WIN32 AND CMAKE_CXX_COMPILER_ID MATCHES "Intel")
#   set (PCH_INTEL TRUE)
# endif ()



# Sets PCH_SUPPORTED to TRUE if the platform supports precompiled headers,
# otherwise it is set to FALSE. Do not try to use the
# pch_add_<library|executable> macros unless this is TRUE.
if (PCH_MSVC OR PCH_GCC OR PCH_CLANG OR PCH_INTEL)
  set (PCH_SUPPORTED TRUE)
else ()
  set (PCH_SUPPORTED FALSE)
endif ()



# Helper function to write a file only if its content changes. Used to
# avoid unnecessary rebuilds
function (pvt_write_if_changed filename text)
  set (needs_write TRUE)
  if (EXISTS "${filename}")
    file (READ "${filename}" text_current)
    if ("${text_current}" STREQUAL "${text}")
      set (needs_write FALSE)
    endif ()
  endif ()
  if (needs_write)
    file (WRITE "${filename}" "${text}")
  endif ()
endfunction ()



# Funtion to return the current count of PCH headers
function (pvt_get_pch_count out_var_name)
  get_property(pchcount GLOBAL PROPERTY "pch_count")
  if (NOT pchcount)
    set (pchcount 0)
  endif ()
  set (${out_var_name} ${pchcount} PARENT_SCOPE)
endfunction ()

# Function to increment by one the count of PCH headers
function (pvc_increment_pch_count)
  pvt_get_pch_count (pchcount)
  math (EXPR pchcount "${pchcount} + 1")
  set_property (GLOBAL PROPERTY "pch_count" ${pchcount})
endfunction ()



# Private function to generate the rules for compiling the PCH.
# Assumes pch_header does not contain directories, eg foo.h
# The variable contained in out_stub_src_var will hold the name of the
# generated source stub file.
function (PVT_ADD_PCH_RULE_MSVC pch_header_filename out_stub_src_var pch_subdir_external)
  get_filename_component (pch_header "${pch_header_filename}" NAME)
  get_filename_component (pch_header_path "${pch_header_filename}" PATH)
  get_filename_component (pch_header_name "${pch_header_filename}" NAME_WE)
  if(NOT pch_subdir_external)
    pvt_get_pch_count (pch_count)
    set(pch_subdir "pch.${pch_count}")
  else()
    set(pch_subdir "${pch_subdir_external}")
  endif()
  set (stub_src "${CMAKE_CURRENT_BINARY_DIR}/${pch_subdir}/${pch_header_name}_stub.cpp")
  set (stub_src_text
    "// Stub file for the PCH ${pch_header}. Generated by CMake.\n#include <${pch_header}>\n"
  )
  pvt_write_if_changed ("${stub_src}" "${stub_src_text}")
  set_property (SOURCE "${stub_src}" PROPERTY 
    COMPILE_FLAGS "/Yc\"${pch_header}\" /I\"${pch_header_path}\"")
  set (${out_stub_src_var} "${stub_src}" PARENT_SCOPE)
endfunction ()



# Helper function to extract the configuration-dependent compile flags.
# "cfgname" name is usually Release, Debug, RelWithDebugInfo or RelMinSize
function (pvt_config_flags cfgname out_list_var_name)
  string (TOUPPER ${cfgname} cfg_upper)
  set (args_cxx "${CMAKE_CXX_FLAGS} ${CMAKE_CXX_FLAGS_${cfg_upper}}")
  separate_arguments (args_cxx)
  
  get_directory_property (dir_compile_defs COMPILE_DEFINITIONS_${cfg_upper})
  foreach (dir_def ${dir_compile_defs})
    list (APPEND args_cxx "-D${dir_def}")
  endforeach ()
  
  set (${out_list_var_name} ${args_cxx} PARENT_SCOPE)
endfunction ()



# Based on CMake's proposed module PCH_GCC4_v2.cmake (2010-07-26)
# http://www.cmake.org/Bug/view.php?id=1260
function (PVT_ADD_PCH_RULE pch_header_filename out_generated_files
       out_pch_filename extra_compile_flags pch_subdir_external)
  if (PCH_GCC)
    set (pch_ext "gch")
  elseif (PCH_CLANG)
    set (pch_ext "pch")
  elseif (PCH_INTEL)
    set (pch_ext "pchi")
  else ()
    message (AUTHOR_WARNING "Function being used for neither gcc, clang not intel")
  endif ()
  
  get_filename_component (pch_header "${pch_header_filename}" NAME)
  get_filename_component (pch_header_path "${pch_header_filename}" PATH)
  get_filename_component (pch_header_name "${pch_header_filename}" NAME_WE)
  if(NOT pch_subdir_external)
    pvt_get_pch_count (pch_count)
    set(pch_subdir "pch.${pch_count}")
  else()
    set(pch_subdir "${pch_subdir_external}")
  endif()
  set (pch_dir_cfgname "${CMAKE_CURRENT_BINARY_DIR}/${pch_subdir}/@CFGNAME@")
  set (pch_filename_cfgname "${pch_dir_cfgname}/${pch_header}.${pch_ext}")
  
  # Generate the stub file for the Intel Compiler
  if (PCH_INTEL)
    set (pch_stub_src "${CMAKE_CURRENT_BINARY_DIR}/${pch_subdir}/${pch_header_name}_stub.cpp")
    set (pch_stub_src_text
      "// Stub file for the PCH ${pch_header}. Generated by CMake.\n#include <${pch_header}>\n"
    )
    pvt_write_if_changed ("${pch_stub_src}" "${pch_stub_src_text}")
  endif ()
  
  # Build the arguments list for calling the compiler
  set (pch_args "")
  
  get_directory_property (pch_definitions COMPILE_DEFINITIONS)
  foreach (pch_def ${pch_definitions})
    list (APPEND pch_args "-D${pch_def}")
  endforeach ()

  # Add all the current include directories
  get_directory_property (pch_dirinc INCLUDE_DIRECTORIES)
  list(REMOVE_DUPLICATES pch_dirinc)
  foreach (pch_inc ${pch_dirinc})
    set(pch_inc_system OFF)
    if (CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES)
      get_filename_component(pch_inc_abs  "${pch_inc}" REALPATH)
      foreach(implicit_inc ${CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES})
        get_filename_component(implicit_inc_abs  "${implicit_inc}" REALPATH)
        if (pch_inc_abs STREQUAL implicit_inc_abs)
          set(pch_inc_system ON)
          break()
        endif()
      endforeach()
    endif()
    if (NOT pch_inc_system)
      list (APPEND pch_args "-I${pch_inc}")
    endif()
  endforeach ()
  
  # The OSX deployment target must match as well
  if (APPLE AND (PCH_GCC OR PCH_CLANG))
    if (CMAKE_OSX_DEPLOYMENT_TARGET)
      list(APPEND pch_args
        "-mmacosx-version-min=${CMAKE_OSX_DEPLOYMENT_TARGET}")
    endif()
  endif ()
  
  # Extra flag passed from the caller
  list(APPEND pch_args ${extra_compile_flags})
  
  # Some versions of gcc are not smart enough to identify the file type
  if (PCH_GCC OR PCH_CLANG)
    list(APPEND pch_args "-x" "c++-header")
  endif ()
  
  
  set (pch_generated "")
  
  # Helper internal macro: note that it depends on variables defined later on
  macro(_PCH_ADD_COMMAND)
    if (PCH_GCC OR PCH_CLANG)
      list (APPEND pch_args "-c" "-o" "${pch_filename}"
        "${pch_header_filename}")
    elseif (PCH_INTEL)
      list (APPEND pch_args "-c" "-pch-create" "${pch_filename}"
        "-I" "${pch_header_path}" "${pch_stub_src}")
    endif ()
    get_filename_component(_pch_location "${pch_filename}" PATH)
    add_custom_command (OUTPUT "${pch_filename}"
      COMMAND "${CMAKE_COMMAND}" -E make_directory "${_pch_location}"
      COMMAND "${CMAKE_CXX_COMPILER}" "${CMAKE_CXX_COMPILER_ARG1}"
              ${args_cxx} ${pch_args}
      DEPENDS "${pch_header_filename}"
      IMPLICIT_DEPENDS CXX "${pch_header_filename}"
    )
    list (APPEND pch_generated "${pch_filename}")
    unset (_pch_location)
  endmacro ()
  
  
  # Create the appropriate custom commands and custom target
  if (CMAKE_CONFIGURATION_TYPES)
    foreach (CFGNAME ${CMAKE_CONFIGURATION_TYPES})
      string (CONFIGURE "${pch_dir_cfgname}" pch_dir @ONLY)
      string (CONFIGURE "${pch_filename_cfgname}" pch_filename @ONLY)
      pvt_config_flags (${CFGNAME} args_cxx)
      _PCH_ADD_COMMAND ()
    endforeach ()
  else ()
    set (CFGNAME ".")
    string (CONFIGURE "${pch_dir_cfgname}" pch_dir @ONLY)
    string (CONFIGURE "${pch_filename_cfgname}" pch_filename @ONLY)
    if (CMAKE_BUILD_TYPE)
      pvt_config_flags (${CMAKE_BUILD_TYPE} args_cxx)
    else ()
      set (args_cxx "${CMAKE_CXX_FLAGS}")
      separate_arguments (args_cxx)
    endif ()
    _PCH_ADD_COMMAND ()
  endif ()
  
  # Set the properties on the generated files
  set_source_files_properties (${pch_generated} PROPERTIES
    GENERATED ON 
    HEADER_ONLY ON)
  
  set (CFGNAME "${CMAKE_CFG_INTDIR}")
  string (CONFIGURE "${pch_filename_cfgname}" pch_filename_final @ONLY)
  set (${out_pch_filename} ${pch_filename_final} PARENT_SCOPE)
endfunction ()



# Helper macro to set up the rules to create the PCH, add the dependencies
# and set up the appropriate include directories.
# The second to last argument is optional, it is the extra_compile_flags.
# The last argument is also optional, it is a specific subdirectory on which
# the PCH will be created for gcc and clang. Note that when this is used,
# the same value needs to be provided in PVT_PCH_USE
macro (PVT_PCH_SOURCES_GROUP header_filename_orig group_name
       out_extrasrcs_var out_pch_filename_var pch_optional_extra_compile_flags
       pch_optional_subdir)
  set (pch_generated "")
  pvc_increment_pch_count ()
  get_filename_component(header_filename "${header_filename_orig}" ABSOLUTE)
  if (PCH_MSVC)
    PVT_ADD_PCH_RULE_MSVC ("${header_filename}" pch_generated
      "${pch_optional_subdir}")
    set (${out_pch_target_var} "")
    set (${out_pch_filename_var} "")
  else ()
    PVT_ADD_PCH_RULE ("${header_filename}" pch_generated
      ${out_pch_filename_var} "${pch_optional_extra_compile_flags}"
      "${pch_optional_subdir}")
  endif ()
  
  set (${out_extrasrcs_var} "${header_filename}" ${pch_generated})
  source_group ("${group_name}" FILES ${${out_extrasrcs_var}})
endmacro ()



# The implementation forces the inclusion of the precompiled header in all
# C++ sources. Note that the sources var "srcs_var" ought not to include
# the PCH stub source file.
# The last argument is optional, it is a specific subdirectory on which
# the PCH will be created for gcc and clang. Note that when this is used,
# the same value needs to be provided in PVT_PCH_SOURCES_GROUP
macro (PVT_PCH_USE pch_header_filename pch_filename target_name srcs_var
       pch_optional_subdir)
  get_filename_component (pch_header "${pch_header_filename}" NAME)
  # Assuming that the precompiled header is C++, the C files need to be
  # either compiled as C++ or not use the PCH. Objective C files cannot
  # use a C++ precompiled header at all.
  set (has_only_cxx_sources ON)
  foreach (pch_src ${${srcs_var}})
    if (pch_src MATCHES ".+\\.([cC]|[mM][mM])$")
      set (has_only_cxx_sources OFF)
      break ()
    endif ()
  endforeach ()
  
  if (PCH_MSVC)
    set (pch_flags " /Yu\"${pch_header}\" /FI\"${pch_header}\"")
  elseif (PCH_GCC OR PCH_CLANG)
    # FIXME: this is coupled with the internal behavior of PVT_ADD_PCH_RULE
    set(pch_subdir "${pch_optional_subdir}")
    if(NOT pch_subdir)
      pvt_get_pch_count (pch_count)
      set(pch_subdir "pch.${pch_count}")
    endif()
    set (pch_flags
      "-include \"${pch_subdir}/${CMAKE_CFG_INTDIR}/${pch_header}\"")
  elseif (PCH_INTEL)
    set (pch_flags "-pch-use \"${pch_filename}\"")
  else ()
    message (AUTHOR_WARNING "Unknown PCH environment")
  endif ()
  
  # If all sources are C++, set the property for the target, otherwise set
  # it in each file separately
  if (has_only_cxx_sources)
    set_property (TARGET ${target_name} APPEND PROPERTY
      COMPILE_FLAGS "${pch_flags}")
  else ()
    foreach (pch_src ${${srcs_var}})
      if (pch_src MATCHES ".+\\.[cCpPxX][cCpPxX]+$")
        set_property (SOURCE ${pch_src} APPEND PROPERTY
          COMPILE_FLAGS "${pch_flags}")
      endif()
    endforeach ()
  endif ()
  
  # Add the dependencies
  foreach (pch_src ${${srcs_var}})
    if (pch_src MATCHES ".+\\.[cCpPxX][cCpPxX]+$")
      set_property (SOURCE ${pch_src} PROPERTY
        OBJECT_DEPENDS "${pch_filename}")
    endif()
  endforeach ()
  
  # On non-MSVC add the base directory with the PCH to the include list in
  # order to allow builds using absolute paths
  # FIXME: this is coupled with the internal behavior of PVT_ADD_PCH_RULE
  if (NOT PCH_MSVC)
    set_property(TARGET ${target_name} APPEND PROPERTY
      INCLUDE_DIRECTORIES "${CMAKE_CURRENT_BINARY_DIR}")
  endif()
endmacro ()



# Adds a library using a common PCH.
# Usage:
#  pch_add_library(name [SHARED | MODULE | STATIC]
#                  [EXCLUDE_FROM_ALL]
#                  PCH_HEADER <header>
#                  source1 source2 ... sourceN)
function (pch_add_library _libname)
  CMAKE_PARSE_ARGUMENTS (_pch "SHARED;MODULE;STATIC;EXCLUDE_FROM_ALL" "PCH_HEADER" "" ${ARGN})
  if (NOT _pch_PCH_HEADER)
    message (FATAL_ERROR "Missing PCH header!")
  endif ()
  set (_libsrcs ${_pch_UNPARSED_ARGUMENTS})
  
  # Poor man's n-ary xor
  set (_pch_count 0)
  set (_pch_libtype "")
  if (_pch_SHARED)
    set (_pch_libtype "SHARED")
    math (EXPR _pch_count "${_pch_count} + 1")
  endif ()
  if (_pch_MODULE)
    set (_pch_libtype "MODULE")
    math (EXPR _pch_count "${_pch_count} + 1")
  endif ()
  if (_pch_STATIC)
    set (_pch_libtype "STATIC")
    math (EXPR _pch_count "${_pch_count} + 1")
  endif ()
  if (_pch_count GREATER 1)
    message (AUTHOR_WARNING "More than one library type specified. Using \"${_pch_libtype}\"")
  endif ()
  if (_pch_EXCLUDE_FROM_ALL)
    set (_pch_exclude "EXCLUDE_FROM_ALL")
  endif ()
  
  if (CMAKE_SYSTEM_NAME STREQUAL "Linux" AND 
      (PCH_GCC OR PCH_CLANG OR PCH_INTEL))
    set (pch_extra_compile_flags "-fPIC")
  endif ()
  string(REPLACE " " "_" _pch_subdir "${_libname}_pch")
  PVT_PCH_SOURCES_GROUP ("${_pch_PCH_HEADER}" "PCH Sources"
       _pch_srcs _pch_filename "${pch_extra_compile_flags}" ${_pch_subdir})
  add_library (${_libname} ${_pch_libtype} ${_pch_exclude}
    ${_libsrcs} ${_pch_srcs})
  PVT_PCH_USE ("${_pch_PCH_HEADER}" "${_pch_filename}" ${_libname}
    _libsrcs ${_pch_subdir})
  if (NOT PCH_MSVC AND _pch_filename)
    add_custom_target("${_libname}_pch" DEPENDS "${_pch_filename}")
    add_dependencies(${_libname} "${_libname}_pch")
  endif()
endfunction ()



# Adds an executable using a common PCH.
# Usage:
#  pch_add_executable(name [WIN32] [MACOSX_BUNDLE]
#                  [EXCLUDE_FROM_ALL]
#                  PCH_HEADER <header>
#                  source1 source2 ... sourceN)
function (pch_add_executable _exename)
  CMAKE_PARSE_ARGUMENTS (_pch "WIN32;MACOSX_BUNDLE;EXCLUDE_FROM_ALL" "PCH_HEADER" "" ${ARGN})
  if (NOT _pch_PCH_HEADER)
    message (FATAL_ERROR "Missing PCH header!")
  endif ()
  set (_exesrcs ${_pch_UNPARSED_ARGUMENTS})

  if (_pch_WIN32)
    set (_pch_exetype "WIN32")
  endif ()
  if (_pch_MACOSX_BUNDLE)
    set (_pch_exetype "MACOSX_BUNDLE")
  endif ()
  if (_pch_EXCLUDE_FROM_ALL)
    set (_pch_exclude "EXCLUDE_FROM_ALL")
  endif ()
  if (_pch_WIN32 AND _pch_MACOSX_BUNDLE)
    message (AUTHOR_WARNING "Both WIN32 and MACOSX_BUNDLE selected. Using \"${_pch_exetype}\".")
  endif ()
  
  string(REPLACE " " "_" _pch_subdir "${_exename}_pch")
  PVT_PCH_SOURCES_GROUP ("${_pch_PCH_HEADER}" "PCH Sources"
       _pch_srcs _pch_filename "" ${_pch_subdir})
  add_executable (${_exename} ${_pch_exetype} ${_pch_exclude}
    ${_exesrcs} ${_pch_srcs})
  PVT_PCH_USE ("${_pch_PCH_HEADER}" "${_pch_filename}" ${_exename}
    _exesrcs ${_pch_subdir})
  if (NOT PCH_MSVC AND _pch_filename)
    add_custom_target("${_exename}_pch" DEPENDS "${_pch_filename}")
    add_dependencies(${_exename} "${_exename}_pch")
  endif()
endfunction ()

