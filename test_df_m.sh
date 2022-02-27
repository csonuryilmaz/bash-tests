#!/usr/bin/env bash

shopt -s expand_aliases
alias df='df_mocked'

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

df_mocked() {
  echo 'Filesystem Size Used Avail Use% Mounted on'
  echo '/dev/sda2 100G 89.0G 11.0G 89% /'
  return 0
}

test_itShouldBeSuccessWhenDfIsMocked() {
  df >"$stdoutF" 2>"$stderrF"

  assertTrue 'It should exit with success.' $?
  assertNull 'It should exit without any error.' "$(cat "$stderrF")"
  assertContains "$(cat "$stdoutF")" '/dev/sda2'
}

. "$(which shunit2)"
