# Determine probe ABI identifier
#

# Copyright (c) 2011-2016 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>
# All rights reserved.
#
# Author: Volker Krause <volker.krause@kdab.com>
# Author: Filipe Azevedo <filipe.azevedo@kdab.com>
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
#
# 1. Redistributions of source code must retain the copyright
#    notice, this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the copyright
#    notice, this list of conditions and the following disclaimer in the
#    documentation and/or other materials provided with the distribution.
# 3. The name of the author may not be used to endorse or promote products
#    derived from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
# IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
# OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
# IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
# NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
# THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
# THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

# This contains all properties that define ABI compatibility of a probe with a target

# Qt version
if(Qt5Core_FOUND)
  set(GAMMARAY_PROBE_ABI "qt${Qt5Core_VERSION_MAJOR}_${Qt5Core_VERSION_MINOR}")
else()
  set(GAMMARAY_PROBE_ABI "qt${QT_VERSION_MAJOR}_${QT_VERSION_MINOR}")
endif()

# on Windows, the compiler also matters
if(WIN32)
  set(GAMMARAY_PROBE_ABI "${GAMMARAY_PROBE_ABI}-${CMAKE_CXX_COMPILER_ID}")
endif()

# processor architecture
# this is a bit messy since CMAKE_SYSTEM_PROCESSOR seems to contain the host CPU rather than the target architecture sometimes
# and is empty on cross-builds by default
if(NOT CMAKE_SYSTEM_PROCESSOR)
  message(FATAL_ERROR "Unknown target architecture. Make sure to specify CMAKE_SYSTEM_PROCESSOR in your toolchain file!")
endif()

# on Windows our best bet is CMAKE_SIZEOF_VOID_P and assuming a x86 host==target build
if(WIN32)
  if(CMAKE_SIZEOF_VOID_P EQUAL 8)
    set(GAMMARAY_PROBE_ABI "${GAMMARAY_PROBE_ABI}-x86_64")
  else()
    set(GAMMARAY_PROBE_ABI "${GAMMARAY_PROBE_ABI}-i686")
  endif()

# on Mac we apparently always get i386 on x86
elseif(APPLE)
  if(CMAKE_SYSTEM_PROCESSOR MATCHES "i386" AND CMAKE_SIZEOF_VOID_P EQUAL 8)
    set(GAMMARAY_PROBE_ABI "${GAMMARAY_PROBE_ABI}-x86_64")
  elseif(CMAKE_SYSTEM_PROCESSOR MATCHES "x86_64" AND CMAKE_SIZEOF_VOID_P EQUAL 4)
    set(GAMMARAY_PROBE_ABI "${GAMMARAY_PROBE_ABI}-i686")
  else()
    set(GAMMARAY_PROBE_ABI "${GAMMARAY_PROBE_ABI}-${CMAKE_SYSTEM_PROCESSOR}")
  endif()

else()
  # uname reports different ARM versions, unlike ELF, so map all this to "arm"
  if(CMAKE_SYSTEM_PROCESSOR MATCHES "arm")
    set(GAMMARAY_PROBE_ABI "${GAMMARAY_PROBE_ABI}-arm")
  else()
    set(GAMMARAY_PROBE_ABI "${GAMMARAY_PROBE_ABI}-${CMAKE_SYSTEM_PROCESSOR}")
  endif()
endif()

message(STATUS "Building probe for ABI: ${GAMMARAY_PROBE_ABI} (${CMAKE_BUILD_TYPE})")
