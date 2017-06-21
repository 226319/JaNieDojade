QT += qml quick webview widgets

CONFIG += c++11 -I inc

SOURCES += \
    src/Astar.cpp \
    src/Fascade_graph.cpp \
    src/QRoute.cpp \
    src/main.cpp


RESOURCES += qml.qrc \

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    inc/Route.hpp \
    inc/Vertex.hpp \
    inc/Defines.hpp \
    inc/Exceptions.hpp \
    inc/Astar.hpp \
    inc/Defines.hpp \
    inc/Edge.hpp \
    inc/Exceptions.hpp \
    inc/Fascade_graph.hpp \
    inc/Igraph.hpp \
    inc/Includes.hpp \
    inc/Ipathfinder.hpp \
    inc/List_graph.hpp \
    inc/Route_matcher.hpp \
    inc/Route.hpp \
    inc/Vertex.hpp \
    inc/QRoute.h

DISTFILES += \
    js/EditMapScripts.js \
    js/Waypoints.js \
    html/Map.html

