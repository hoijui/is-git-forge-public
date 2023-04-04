#!/usr/bin/env bats
# SPDX-FileCopyrightText: 2023 Robin Vobruba <hoijui.quaero@gmail.com>
# SPDX-License-Identifier: AGPL-3.0-only

is_git_forge_public="src/software/is-git-forge-public"


function check() {
  "$is_git_forge_public" "$@"
}

function res_is_pub() {
  local res="$1"

  local res_first_line="$(echo "$res" | head -n 1)"
  [ "$res_first_line" = "true" ]

  local res_last_line="$(echo "$res" | tail -n 1)"
  [ "$res_last_line" = "public" ]
}

function res_is_non_pub() {
  local res="$1"

  local res_first_line="$(echo "$res" | head -n 1)"
  [ "$res_first_line" = "false" ]
}

function res_is_priv() {
  local res="$1"

  res_is_non_pub "$res"

  local res_last_line="$(echo "$res" | tail -n 1)"
  [ "$res_last_line" = "private" ]
}

function res_is_unidentifyable() {
  local res="$1"

  res_is_non_pub "$res"

  local res_last_line="$(echo "$res" | tail -n 1)"
  [ "$res_last_line" = "unidentifyable" ]
}