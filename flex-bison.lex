/* lex filename.lex # win_flex filename.lex
 * gcc lex.yy.c
 * ./a.out # ./a.exe
 */

/* definitions */
%{

int count = 0;

%}

/* rules */
%%

[A-Z] {
  printf("%s capital letter\n", yytext);
  count++;
}

. {
  printf("%s not a capital letter\n", yytext);
}

\n {
  return 0;
}

%%

/* code */
int yywrap() {}

int main()
{
  yylex();
  printf("number of capital letters: %d\n", count);
  return 0;
}
