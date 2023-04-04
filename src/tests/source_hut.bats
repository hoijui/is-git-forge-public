#!/usr/bin/env bats
# SPDX-FileCopyrightText: 2023 Robin Vobruba <hoijui.quaero@gmail.com>
# SPDX-License-Identifier: AGPL-3.0-only

repo_public="https://git.sr.ht/~hoijui/test-pub"
repo_private="https://git.sr.ht/~hoijui/sourcehut-test"
repo_unlisted="https://git.sr.ht/~hoijui/test-unlstd"

TESTS_ROOT="$(dirname "$BATS_TEST_FILENAME")"
. "$TESTS_ROOT/common.bats"

@test "Should test as public - all methods" {
  res="$(check "$repo_public")"
  res_is_pub "$res"
}

@test "Should test as public - forge specific" {
  res="$(check --check sourcehut "$repo_public")"
  res_is_pub "$res"
}

@test "Should test as not public (unidentifyable) - forge specific - others" {
  res="$(check --check github "$repo_public")"
  res_is_unidentifyable "$res"

  res="$(check --check gitlab "$repo_public")"
  res_is_unidentifyable "$res"

  res="$(check --check gitea "$repo_public")"
  res_is_unidentifyable "$res"
}

@test "Should test as not public (private) - all methods" {
  res="$(check "$repo_private")"
  res_is_non_pub "$res"
}

@test "Should test as not public (private) - forge specific" {
  res="$(check --check sourcehut "$repo_private")"
  res_is_non_pub "$res"
}

@test "Should test as not public (unlisted) - all methods" {
  res="$(check "$repo_unlisted")"
  res_is_non_pub "$res"
}

@test "Should test as not public (unlisted) - forge specific" {
  res="$(check --check sourcehut "$repo_unlisted")"
  res_is_non_pub "$res"
}