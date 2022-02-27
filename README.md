# Bash Tests

Repository contains some examples of bash tests written with [shunit2](https://github.com/kward/shunit2).

`test_df_m.sh` has a simple test for **mocked** `df` command. It explains how to mock a system command.

`test_df.sh` has a simple test real `df` command.

Both tests shows how to check exit code and output of an executed command under test.

Mocked and real tests can not be in the same test file because of alias usage. We can unalias but it will introduce unnecessary complexity. So organizing tests in different files seems to better for maintenance.

In order to run all tests in different files I added a test runner. It selects all test files (`test_` prefixed) and executes them in selected order. If any of them gives an error, it stops. (fail early)

Happy coding! :coffee:
