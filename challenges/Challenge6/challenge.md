```markdown
# Bash Scripting Exercise: Log Clean-up & Archive Automation

## Scenario
You are working as a System Administrator. Your server's application directory is getting cluttered with `.log` files of various sizes. Some are empty system noise, some are small active files, and others are massive old logs taking up valuable disk space. 

Your task is to write a robust Bash script to automate the cleanup and archiving process for these files.

## Requirements

1. **User Input & Validation**:
   - Prompt the user to input a directory path.
   - Verify if the provided path exists and is a valid directory. If it doesn't exist, print an error message to `stderr` and exit with a non-zero status code.

2. **Clean Empty Logs**:
   - Identify all files ending in `.log` within the target directory that have a size of exactly `0` bytes.
   - Delete these empty files to clear up clutter.

3. **Archive Large Logs**:
   - Identify all files ending in `.log` that are larger than **10KB** (10,240 bytes).
   - Compress each of these files individually into a `.tar.gz` format.
   - Move the compressed archives into a subdirectory named `archive/` inside the target directory. (Create the `archive/` folder automatically if it doesn't exist).
   - *Bonus challenge*: Delete the original uncompressed log file only after verifying the archive was created successfully.

4. **Generate a Summary Report**:
   - Create or overwrite a file named `cleanup_report.txt` in the execution directory.
   - The report must include:
     - The timestamp of when the cleanup was run.
     - The total number of empty log files deleted.
     - The total number of large log files archived.

```