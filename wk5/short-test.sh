#!/bin/dash

# add the current directory to the PATH so scripts
# can still be executed from it after we cd

PATH="$PATH:$(pwd)"

# Create a temporary directory for the test.
test_dir="$(mktemp -d)"
cd "$test_dir" || exit 1
ref_dir="$(mktemp -d)"
cd "$ref_dir" || exit 1

# Create some files to hold output.

expected_stdout="$(mktemp)"
expected_stderr="$(mktemp)"
actual_stdout="$(mktemp)"
actual_stderr="$(mktemp)"

trap 'rm "$expected_stdout" "$expected_stderr" "$actual_stdout" "$actual_stderr" -r "$test_dir"' INT HUP QUIT TERM EXIT

cd "$ref_dir" || exit 1 
prog1.sh 1> $expected_stdout 2> $expected_stderr
ref_exit_code=$?

# Incorrect Case
# cd "$test_dir" || exit 1
# prog2.sh 1> $actual_stdout 2> $actual_stderr
exit_code=$?

# Correct case
cd "$test_dir" || exit 1
prog3.sh 1> $actual_stdout 2> $actual_stderr
exit_code=$?

if ! diff $actual_stdout $expected_stdout 
then
    echo "====================="
    echo "Failed test - stdout differs"
    echo "Expected: $expected_stdout"
    echo "====================="
    exit 1
fi

if [ "$exit_code" -ne "$ref_exit_code" ]
 then
    echo "====================="
    echo "Failed test - exit code differs"
    echo "Expected: $ref_exit_code"
    echo "====================="
    exit 1
fi

echo "Test passed!"
exit 0