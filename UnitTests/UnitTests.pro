TARGET = MyUnitTests
TEMPLATE = app
CONFIG += console c++11
CONFIG -= app_bundle
CONFIG -= qt

SOURCES += MyUnitTests.cc

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

# depends "GoogleTest"
win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../thirdparty/release/ -lgoogletest
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../thirdparty/debug/ -lgoogletest
else:unix: LIBS += -L$$OUT_PWD/../thirdparty/ -lgoogletest

INCLUDEPATH += $$PWD/../thirdparty/googletest/googletest/include
DEPENDPATH += $$PWD/../thirdparty/googletest/googletest/include

win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../thirdparty/release/libgoogletest.a
else:win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../thirdparty/debug/libgoogletest.a
else:win32:!win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../thirdparty/release/googletest.lib
else:win32:!win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../thirdparty/debug/googletest.lib
else:unix: PRE_TARGETDEPS += $$OUT_PWD/../thirdparty/libgoogletest.a
