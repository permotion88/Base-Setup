CXX=g++
CPPFLAGS=-Wall -std=c++14
SRCDIR=.
BINDIR=bin
GTESTDIR=thirdparty/googletest/googletest
INCLUDES=-I$(GTESTDIR) -I$(GTESTDIR)/include
LINKFLAGS=

ifeq ($(shell echo "check_quotes"),"check_quotes")
	PATHSEP2=\\
	BINEXT=.exe
	DELFILE=del
	MKDIRP=md	
else
	PATHSEP2=/
	BINEXT=
	DELFILE=rm -f
	MKDIRP=mkdir -p
	LINKFLAGS=-lpthread
endif
PATHSEP=$(strip $(PATHSEP2))

all: build

bin:
	$(MKDIRP) $(BINDIR)

build: build-unit build-text
build-unit: bin $(BINDIR)/MyUnitTests$(BINEXT)
build-text: bin $(BINDIR)/MyTextTests$(BINEXT)

$(BINDIR)/MyUnitTests$(BINEXT): $(SRCDIR)/MyClass.cc $(SRCDIR)/MyClass.h $(SRCDIR)/MyUnitTests.cc $(GTESTDIR)/src/gtest-all.cc $(GTESTDIR)/src/gtest_main.cc
	$(CXX) $(CPPFLAGS) $(INCLUDES) -I$(SRCDIR) -o $(BINDIR)/MyUnitTests$(BINEXT) $(SRCDIR)/MyClass.cc $(SRCDIR)/MyUnitTests.cc $(GTESTDIR)/src/gtest-all.cc $(GTESTDIR)/src/gtest_main.cc $(LINKFLAGS)

$(BINDIR)/MyTextTests$(BINEXT): $(SRCDIR)/MyClass.cc $(SRCDIR)/MyClass.h $(SRCDIR)/MyTextTests.cc
	$(CXX) $(CPPFLAGS) $(INCLUDES) -I$(SRCDIR) -o $(BINDIR)/MyTextTests$(BINEXT) $(SRCDIR)/MyClass.cc $(SRCDIR)/MyTextTests.cc $(LINKFLAGS)

test: $(BINDIR)/MyUnitTests$(BINEXT)
	$(BINDIR)/MyUnitTests$(BINEXT)

run: $(BINDIR)/MyTextTests$(BINEXT)
	$(BINDIR)/MyTextTests$(BINEXT)

clean:
	- $(DELFILE) $(BINDIR)$(PATHSEP)MyUnitTests$(BINEXT)
	- $(DELFILE) $(BINDIR)$(PATHSEP)MyTextTests$(BINEXT)
