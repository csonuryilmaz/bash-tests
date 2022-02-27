#!/usr/bin/env bash

oneTimeSetUp() {
  echo "shunit: $SHUNIT_VERSION"
  echo "$SHUNIT_TMPDIR"
  echo ""

  # Define global variables for command output.
  stdoutF="${SHUNIT_TMPDIR}/stdout"
  stderrF="${SHUNIT_TMPDIR}/stderr"
}

setUp() {
  # Truncate the output files.
  cp /dev/null "${stdoutF}"
  cp /dev/null "${stderrF}"
}

test_itShouldBeSuccessWhenDfIsNotMocked() {
  df >"$stdoutF" 2>"$stderrF"

  assertTrue 'It should exit with success.' $?
  assertNull 'It should exit without any error.' "$(cat "$stderrF")"
  assertEquals 'It should print header for device list.' 'Filesystem     1K-blocks      Used Available Use% Mounted on' "$(head -1 "$stdoutF")"
  assertTrue 'It should have at least one device in list.' "[ $(wc -l "$stdoutF" | awk '{ print $1 }') -gt 1 ]"
}

. "$(which shunit2)"
