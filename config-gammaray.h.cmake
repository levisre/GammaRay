#include <qglobal.h>

#if !defined(CONFIG_GAMMARAY_H)
#define CONFIG_GAMMARAY_H

#cmakedefine GAMMARAY_INSTALL_QT_LAYOUT
#define GAMMARAY_DEBUG_POSTFIX "${CMAKE_DEBUG_POSTFIX}"

// relative install dirs
#define GAMMARAY_PLUGIN_INSTALL_DIR "${PLUGIN_INSTALL_DIR}"
#define GAMMARAY_LIBEXEC_INSTALL_DIR "${LIBEXEC_INSTALL_DIR}"
#define GAMMARAY_BUNDLE_INSTALL_DIR "${BUNDLE_INSTALL_DIR_PRIVATE}"
#define GAMMARAY_BIN_INSTALL_DIR "${BIN_INSTALL_DIR}"
#define GAMMARAY_PROBE_INSTALL_DIR "${PROBE_INSTALL_DIR}"

#define GAMMARAY_PLUGIN_VERSION "${GAMMARAY_PLUGIN_VERSION}"
#define GAMMARAY_PROBE_ABI "${GAMMARAY_PROBE_ABI}${GAMMARAY_PROBE_ABI_POSTFIX}"

// relative inverse install dirs
#define GAMMARAY_INVERSE_BUNDLE_DIR "${GAMMARAY_INVERSE_BUNDLE_DIR}"
#define GAMMARAY_INVERSE_BIN_DIR "${GAMMARAY_INVERSE_BIN_DIR}"
#define GAMMARAY_INVERSE_PROBE_DIR "${GAMMARAY_INVERSE_PROBE_DIR}"
#define GAMMARAY_INVERSE_LIBEXEC_DIR "${GAMMARAY_INVERSE_LIBEXEC_DIR}"

// probe name
#define GAMMARAY_PROBE_BASENAME "${PROBE_BASENAME}"

// default network properties
#define GAMMARAY_DEFAULT_LOCAL_ADDRESS "127.0.0.1"
#define GAMMARAY_DEFAULT_LOCAL_TCP_URL "tcp://127.0.0.1"
#define GAMMARAY_DEFAULT_ANY_ADDRESS "0.0.0.0"
#define GAMMARAY_DEFAULT_ANY_TCP_URL "tcp://0.0.0.0"

// build options
#cmakedefine BUILD_TIMER_PLUGIN

#cmakedefine HAVE_PRIVATE_QT_HEADERS

#cmakedefine HAVE_STDINT_H
#cmakedefine HAVE_BACKTRACE
#cmakedefine HAVE_CXA_DEMANGLE

#cmakedefine HAVE_QT_WIDGETS
#cmakedefine HAVE_QT_SVG
#cmakedefine HAVE_QT_DESIGNER
#cmakedefine HAVE_QT_PRINTSUPPORT
#cmakedefine HAVE_QT_WEBKIT1

#cmakedefine HAVE_VTK

#cmakedefine HAVE_ELF_H
#cmakedefine HAVE_SYS_ELF_H
#cmakedefine HAVE_ELF

#cmakedefine GAMMARAY_ENABLE_GPL_ONLY_FEATURES

#endif // CONFIG_GAMMARAY_H
