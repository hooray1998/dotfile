# ack
> A search tool like grep, optimized for programmers
> More information: <https://beyondgrep.com/documentation/>
- **Find files containing "foo":**
ack `foo`
- **Find files of a specific type:**
ack --ruby `foo`
- **Count the total number of matches for the term "foo":**
ack -ch `foo`
- **Show the file names containing "foo" and number of matches in each file:**
ack -cl `foo`
- **List all valid types:**
ack --help=types
