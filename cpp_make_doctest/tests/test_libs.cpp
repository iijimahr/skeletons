////
//// Test library
////
#include <doctest/doctest.h>

#include "libs.hpp"

TEST_CASE("libs") {
  CHECK(libs::add(1, 2) == 3);
  CHECK(libs::add(-3, 2) == -1);
  CHECK(libs::add(0, 0) == 0);
  // CHECK(libs::add(0, 0) == 1);  // invalid test case
}
