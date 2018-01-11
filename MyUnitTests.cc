#include <gtest/gtest.h>

#include "MyClass.h"

TEST(TriviaTest, Foo) {
	MyClass myClass;
    EXPECT_EQ(false, myClass.isAlwaysTrue()); //FIXME
}
