TARGET = MyTextTests
TEMPLATE = app
CONFIG += console c++11
CONFIG -= app_bundle
CONFIG -= qt

SOURCES += MyTextTests.cc

# depends "MyLib" Library
win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../Library/release/ -lMyLib
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../Library/debug/ -lMyLib
else:unix: LIBS += -L$$OUT_PWD/../Library/ -lMyLib

INCLUDEPATH += $$PWD/../Library
DEPENDPATH += $$PWD/../Library

win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../Library/release/libMyLib.a
else:win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../Library/debug/libMyLib.a
else:win32:!win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../Library/release/MyLib.lib
else:win32:!win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../Library/debug/MyLib.lib
else:unix: PRE_TARGETDEPS += $$OUT_PWD/../Library/libMyLib.a
