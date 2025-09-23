TDD Steps (recommended)

1. Write a failing test for empty input -> expect 0.
2. Implement minimal logic to return 0 for empty string.
3. Add a test for single number -> expect that number.
4. Implement parsing for one number.
5. Add a test for two numbers comma separated.
6. Implement splitting on comma.
7. Add test for newlines mixed with commas.
8. Implement newline support.
9. Add test for custom delimiter using //;\n...
10. Implement custom delimiter parsing.
11. Add tests for negative numbers throw and list all negatives.
12. Implement negative detection and throw a descriptive exception.
13. Add tests for multi-char delimiters and multiple delimiters.
14. Implement bracketed multi-char delimiter parsing and multiple delimiters.
15. (Optional) Add rule: ignore numbers >1000 and add test.
