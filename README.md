# scala-build-test-script
Runs scalac on *ALL* Scala source files in the current directory, pipes inputs from a test directory, compares it with expected values, prints the difference, then deletes *ALL* class files in the directory.

NOTE: This script uses xxd to compare files of outputs in binary!

*Usage:* ./buildTest <program>
  <program> is the same name you would use as if you were running `scala <program>`.
  May not have permissions to run, in which case, do `chmod u+x buildTest.sh`

*Setup:*
1. Copy script to working directory
2. Create a folder called "tests" in your working directory
3. Create a folder called "in" in your newly created "tests" folder
4. Create a folder called "expected" in your "tests" folder
5. Put test inputs in your "in" folder with a .in extension
6. Put expected outputs in your "expected" folder with .out extension
7. Test!
