cmake_minimum_required(VERSION 3.16)

project(TCP_Server VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 COMPONENTS Quick REQUIRED)

qt_add_executable(appTCP_Server
    main.cpp
)

qt_add_qml_module(appTCP_Server
    URI TCP_Server
    VERSION 1.0
    QML_FILES main.qml
     Progress_Bar.qml
     Progress_Bar2.qml
     Progress_Bar3.qml
     Progress_Bar4.qml
     Progress_Bar5.qml
     Gear_Number.qml
     Speed_Number.qml
     Speed_Button.qml
    SOURCES tcp.h tcp.cpp
    QML_FILES
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appRacing_ECU PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appTCP_Server
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(TCP_Server
    PRIVATE Qt6::Quick)

include(GNUInstallDirs)
install(TARGETS appTCP_Server
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
