#! /usr/bin/env dash

# ==============================================================================
# test0.sh
# Test the mygive-submit command.
#
# Written by: Dylan Brotherston <d.brotherston@unsw.edu.au>
# Date: 2025-06-28
# For COMP2041/9044 Assignment 1
# ==============================================================================

# add the current directory to the PATH so scripts
# can still be executed from it after we cd

PATH="$PATH:$(pwd)"

# Create a temporary directory for the test and retrieve the provided test files
test_dir="$(mktemp -d)"
cd "$test_dir" || exit 1
2041 fetch mygive

# Create a temporary directory for the referace and retrieve the provided test files
ref_dir="$(mktemp -d)"
cd "$ref_dir" || exit 1
2041 fetch mygive

# Create some files to hold output.

expected_stdout="$(mktemp)"
expected_stderr="$(mktemp)"
actual_stdout="$(mktemp)"
actual_stderr="$(mktemp)"

# Remove the temporary directory when the test is done.
trap 'rm "$expected_stdout" "$expected_stderr" "$actual_stdout" "$actual_stderr" -r "$test_dir"' INT HUP QUIT TERM EXIT

# Create mygive assessment

cd "$ref_dir" || exit 1
2041 mygive-add lab03_scraping_courses scraping_courses.sh scraping_courses.tests scraping_courses.marking 1> "$expected_stdout" 2> "$expected_stderr"
ref_exit_code=$?

cd "$test_dir" || exit 1
mygive-add lab03_scraping_courses scraping_courses.sh scraping_courses.tests scraping_courses.marking 1> "$actual_stdout" 2> "$actual_stderr"
exit_code=$?

if ! diff "$expected_stdout" "$actual_stdout" >/dev/null 2>&1; then
    echo "Failed test - stdout differs"
    diff "$expected_stdout" "$actual_stdout"
    exit 1
fi

if ! diff "$expected_stderr" "$actual_stderr" >/dev/null 2>&1; then
    echo "Failed test - stderr differs"
    diff "$expected_stderr" "$actual_stderr"
    exit 1
fi

if [ "$exit_code" -ne "$ref_exit_code" ]; then
    echo "Failed test - exit code differs"
    echo "Expected: $ref_exit_code"
    echo "Got: $exit_code"
    exit 1
fi