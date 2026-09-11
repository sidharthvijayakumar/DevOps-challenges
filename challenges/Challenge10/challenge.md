# Bash Scripting Assignment: Backup Script

## Objective

Create a Bash script that backs up a source directory into a destination directory using a timestamped compressed archive.

---

## Script

Create a script named:

```bash
backup.sh
```

The script should be executed as:

```bash
./backup.sh <source_directory> <destination_directory>
```

### Example

```bash
./backup.sh /data /backup
```

---

## Requirements

### 1. Check that the source exists

The script must verify that the source directory provided by the user exists.

If it does not exist, print an appropriate error message and exit with a non-zero exit code.

Example:

```text
ERROR: Source directory '/data' does not exist.
```

---

### 2. Check that the destination exists

The script must verify that the destination directory exists.

If it does not exist, print an appropriate error message and exit with a non-zero exit code.

Example:

```text
ERROR: Destination directory '/backup' does not exist.
```

---

### 3. Create a timestamp

Generate a timestamp using the following format:

```text
YYYY-MM-DD_HHMMSS
```

Example:

```text
2026-09-12_001530
```

Hint:

```bash
date
```

---

### 4. Create the backup archive

Create a compressed `.tar.gz` archive of the source directory.

The backup filename should contain the source directory name and timestamp.

Example:

```text
/backup/data_2026-09-12_001530.tar.gz
```

---

### 5. Display progress

The script should display useful information while running.

Example:

```text
Starting backup...

Source      : /data
Destination : /backup

Creating backup...

Backup completed successfully!

Backup file : /backup/data_2026-09-12_001530.tar.gz
```

---

### 6. Display backup size

After successfully creating the backup, display the size of the generated archive.

Example:

```text
Backup size : 125 MB
```

---

### 7. Exit codes

The script should use appropriate exit codes.

Suggested behavior:

| Situation | Exit Code |
|---|---:|
| Backup successful | `0` |
| Source does not exist | Non-zero |
| Destination does not exist | Non-zero |
| Backup creation fails | Non-zero |

---

## Recommended Bash Practices

Use:

```bash
#!/usr/bin/env bash

set -euo pipefail
```

Try to use:

- Variables
- `if` conditions
- Command substitution
- Functions
- Exit codes
- `tar`
- `date`

---

## Example Expected Output

```text
========================================
          BACKUP SCRIPT
========================================

Source      : /data
Destination : /backup
Timestamp   : 2026-09-12_001530

Creating backup...

Backup completed successfully!

Backup file : /backup/data_2026-09-12_001530.tar.gz
Backup size : 125 MB

========================================
```

---

## Bonus Challenges

Once the basic script works, try these without changing the original requirements.

### Bonus 1 — Automatically create the destination

If `/backup` doesn't exist, ask the user:

```text
Destination directory '/backup' does not exist.
Create it? [y/N]:
```

If the user enters `y`, create it.

---

### Bonus 2 — Prevent accidental overwrite

Before creating the backup, check whether the generated filename already exists.

If it exists, fail safely instead of overwriting it.

---

### Bonus 3 — Accept a custom backup filename

Allow:

```bash
./backup.sh /data /backup my_backup
```

to create:

```text
/backup/my_backup_2026-09-12_001530.tar.gz
```

---

## Constraints

Try to solve the assignment yourself before searching for a complete solution.

Do not use Python, Perl, or another scripting language.

The goal is to practice Bash scripting.
