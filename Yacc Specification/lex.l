%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#define ERROR -1
%}

%%

#define.*  { printf("MACRO"); }
#include.* { printf ("PREPROCESSOR_DIRECTIVE"); }

"//".*    { printf("SINGLE_LINE_COMMENT"); }
"/\*.*\*/" { printf("MULTI_LINE_COMMENT"); }

[a-zA-Z]+[a-zA-Z0-9]*   { printf("VARIABLE"); }
[0-9]+                  { printf("INTGER"); }

[+]      {  printf("ARITHMETIC_OPERATOR"); }
[-]      {  printf("ARITHMETIC_OPERATOR"); }
[*]      {  printf("ARITHMETIC_OPERATOR"); }
[/]      {  printf("ARITHMETIC_OPERATOR"); }
[=]+     {  printf("ASSIGNMENT"); }

if.*      { printf("IF"); }
else.*    { printf("ELSE"); }

[ \t\n]+   /* ignore whitespace */;
.         { printf("Error: Invalid token %s\n", yytext); return ERROR; }

%%

int yyparse(void){return 0;};

int yywrap(){return 1;}

int main(int argc, char* argv[])
{
    if (yyparse() == 0) {
        printf("Parsing completed successfully\n");
    } else {
        printf("Parsing failed\n");
    }
    return 0;
}



