cmake_minimum_required(VERSION 3.16)

project(Tcp_Client VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 COMPONENTS Quick REQUIRED)

qt_add_executable(appTcp_Client
    main.cpp
)

qt_add_qml_module(appTcp_Client
    URI Tcp_Client
    VERSION 1.0
    QML_FILES main.qml
    SOURCES tcp_client.h tcp_client.cpp
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appTcp_Client PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appTcp_Client
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appTcp_Client
    PRIVATE Qt6::Quick)

include(GNUInstallDirs)
install(TARGETS appTcp_Client
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
