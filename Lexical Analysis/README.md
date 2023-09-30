A lexer which recognizes the tokens in the given Mini-C program.

The lexer is implemented on the mini-C language whose features are a subset of the features of the C language. 
The features are as listed below:
- Macros (#define)
- Preprocessor directives ((#include)
- Single line and Multi line comments
- Variables
- Data types supported are integers
- Operators - arithmetic operators
- If-else and assignment statements

- Input : A Mini-C program
Output:
● If the mini-C program is valid, outputs the sequence of tokens <token-id, token-value>
● Else prints Error if the input does not have valid lexical tokens
