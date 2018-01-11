import qbs

Project {
    minimumQbsVersion: "1.7.1"

    references: [
        "thirdparty",
    ]

    StaticLibrary {
        name: "mylib"
        Depends { name: "cpp" }

        files: [
            "MyClass.cc",
            "MyClass.h",
        ]

        Export {
            Depends { name: "cpp" }
        }
    }

    Application {
        name: "my_tests"
        Depends { name: "mylib" }
        consoleApplication: true
        Depends { name: "googletest" }

        files: [
            "MyUnitTests.cc",
        ]
    }

    Application {
        name: "my_app"
        consoleApplication: true
        Depends { name: "mylib" }
        files: [
            "MyTextTests.cc",
        ]
    }
}
