%{
#include <stdio.h>
#include <stdlib.h>
%}

%token INCLUDE MACRO COMMENT_SINGLE COMMENT_MULTI
%token INT IDENTIFIER NUMBER
%token PLUS MINUS MULT DIV MOD
%token LESS_THAN GREATER_THAN LESS_OR_EQUAL GREATER_OR_EQUAL EQUAL NOT_EQUAL
%token ASSIGNMENT
%token IF ELSE WHILE
%token LEFT_PARENTHESIS RIGHT_PARENTHESIS LEFT_BRACKET RIGHT_BRACKET SEMICOLON

%left PLUS MINUS
%left MULT DIV MOD
%left LESS_THAN GREATER_THAN LESS_OR_EQUAL GREATER_OR_EQUAL EQUAL NOT_EQUAL
%nonassoc ASSIGNMENT

%%
program: /* empty */
    | program statement
    ;

statement: preprocessor
    | declaration SEMICOLON
    | assignment SEMICOLON
    | if_statement
    | while_statement
    ;

preprocessor: INCLUDE IDENTIFIER
    | MACRO IDENTIFIER NUMBER
    ;

declaration: INT IDENTIFIER
    ;

assignment: IDENTIFIER ASSIGNMENT expression
    ;

if_statement: IF LEFT_PARENTHESIS expression RIGHT_PARENTHESIS LEFT_BRACKET program RIGHT_BRACKET
    | IF LEFT_PARENTHESIS expression RIGHT_PARENTHESIS LEFT_BRACKET program RIGHT_BRACKET ELSE LEFT_BRACKET program RIGHT_BRACKET
    ;

while_statement: WHILE LEFT_PARENTHESIS expression RIGHT_PARENTHESIS LEFT_BRACKET program RIGHT_BRACKET
    ;

expression: NUMBER
    | IDENTIFIER
    | expression PLUS expression
    | expression MINUS expression
    | expression MULT expression
    | expression DIV expression
    | expression MOD expression
    | expression LESS_THAN expression
    | expression GREATER_THAN expression
    | expression LESS_OR_EQUAL expression
    | expression GREATER_OR_EQUAL expression
    | expression EQUAL expression
    | expression NOT_EQUAL expression
    | LEFT_PARENTHESIS expression RIGHT_PARENTHESIS
    ;

%%

int main(int argc, char **argv) {
    yyparse();
    return 0;
}

int yyerror(char *s) {
    printf("Syntax Error: %s\n", s);
    return 0;
}
