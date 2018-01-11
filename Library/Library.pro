TARGET = MyLib
TEMPLATE = lib
CONFIG += staticlib c++11
CONFIG -= qt

SOURCES += MyClass.cc
HEADERS += MyClass.h

unix {
    target.path = /usr/lib
    INSTALLS += target
}
