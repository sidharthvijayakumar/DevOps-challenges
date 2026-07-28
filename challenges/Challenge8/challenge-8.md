# Bash Scripting Exercise: Git Repository Commit Helper

## Scenario

Imagine you have multiple Git repositories on your machine.

### Directory structure

``` text
~/projects/
├── frontend/
├── backend/
├── auth-service/
├── payment-service/
└── monitoring/
```

## Requirements

Write a Bash script that:

1.  Stores repository names and their commit scopes in an associative
    array.

Example:

``` bash
frontend="ui"
backend="api"
auth-service="auth"
payment-service="payment"
monitoring="monitor"
```

2.  Detects the current directory.

Example:

``` bash
pwd
# /Users/sidharth/projects/payment-service
```

3.  Finds which repository you're currently inside.

4.  Asks the user for a commit type.

Allowed values:

-   feat
-   fix
-   docs
-   refactor
-   test

5.  Asks for a commit message.

Example:

``` text
Handle payment retries
```

6.  Prints the final commit message in the format:

``` text
feat(payment): Handle payment retries
```

If the current directory doesn't belong to any known repository, print:

``` text
Unknown repository
```

## Bonus 1

Support nested directories such as:

``` text
/Users/sidharth/projects/payment-service/src/controllers
```

The script should still detect:

``` text
payment-service
```

> Hint: Don't compare the entire path directly.

## Bonus 2

Validate the commit type.

If the user enters:

``` text
hello
```

Print:

``` text
Invalid commit type
```

and exit.

## Bonus 3

Ask:

``` text
Commit? (y/n)
```

If the answer is `y`, run:

``` bash
git commit -m "feat(payment): Handle payment retries"
```

Otherwise print:

``` text
Cancelled.
```

## Constraints

Try solving it using:

-   `declare -A`
-   `read`
-   `case`
-   `for`
-   `[[ ... ]]`
-   Parameter expansion
-   Functions

Avoid using external commands like `grep`, `awk`, `sed`, or `cut` for
the main logic unless absolutely necessary.

## Example Run

``` text
$ ./commit-helper.sh

Current repository: payment-service

Commit type:
feat

Commit message:
Handle payment retries

Generated commit message:

feat(payment): Handle payment retries

Commit? (y/n)
y

[main 123abc] feat(payment): Handle payment retries
```