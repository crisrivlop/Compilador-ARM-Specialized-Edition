%{
  #include "y.tab.h"
  #include <string>
  #include <string.h>
  #include <stdlib.h>
  #include <iostream>
  
  void yyerror(std::string S);
  void setOperationValue(std::string oper, size_t);
%}

%option yylineno

comment ;.*
label  [a-zA-Z_][a-zA-Z0-9_]*
immedec   \#(0|-?[1-9][0-9]+)
immehex   0x[0-9A-Fa-f]{1,4}
numero [0-9]+
ADD  (A|a)(D|d)(D|d)
SUB  (S|s)(U|u)(B|b)
MOV  (M|m)(O|o)(V|v)
BXX  (B|b)
COL  (C|c)(O|o)(L|l)
EOR  (E|e)(O|o)(R|r)
PLOT (P|p)(L|l)(O|o)(T|t)

black @(000|BLACK|Black|black)
blue  @(001|BLUE|Blue|blue)
green @(010|GREEN|Green|green)
cyan  @(011|CYAN|Cyan|cyan)
red   @(100|RED|Red|red)
magen @(101|MAGENTA|Magenta|magenta)
yllow @(110|YELLOW|Yellow|yellow)
white @(111|WHITE|White|white)




endline \n

allmodifiers (eq|EQ|ne|NE|cs|CS|hs|HS|cc|CC|lo|LO|mi|MI|PL|pl|vs|VS|vc|VC|hi|HI|ls|LS|ge|GE|gt|GT|lt|LT|le|LE|AL|al)


%%



    /*Operation Keywords*/
{ADD}(s|S)?                   {yylval.id=strdup(yytext); return addition;}
{SUB}(s|S)?                   {yylval.id=strdup(yytext); return subtra;}
{MOV}                         {yylval.id=strdup(yytext); return mv;}
{PLOT}                        {yylval.id=strdup(yytext); return plot;}
{BXX}                         {yylval.id=strdup(yytext); return branch;}
{BXX}(e|E)(q|Q)               {yylval.id=strdup(yytext); return brancheq;}
{BXX}(m|M)(i|I)               {yylval.id=strdup(yytext); return branchmi;}
{COL}                         {yylval.id=strdup(yytext); return col;}
{EOR}                         {yylval.id=strdup(yytext); return eor;}



(r|R)([0-9]|1[0-5])           {yylval.id=strdup(yytext); return reg;}
{immedec}                     {yylval.id=strdup(yytext); return immedec;}
{immehex}                     {yylval.id=strdup(yytext); return immehex;}
{label}:                      {yylval.id=strdup(yytext); return memory_direction_tag;}
{label}                       {yylval.id=strdup(yytext); return label;}
{comment}                     {yylval.id=strdup(yytext); return commentary;}

{black}                       {yylval.id=strdup(yytext);return black;}
{blue}                        {yylval.id=strdup(yytext);return blue;}
{green}                       {yylval.id=strdup(yytext);return green;}
{cyan}                        {yylval.id=strdup(yytext);return cyan;}
{red}                         {yylval.id=strdup(yytext);return red;}
{magen}                       {yylval.id=strdup(yytext);return magenta;}
{yllow}                       {yylval.id=strdup(yytext);return yellow;}
{white}                       {yylval.id=strdup(yytext);return white;}


[,\[\]\n\=\!]                 {return yytext[0];}
[\t ]+                        {;}
.                             {yylval.id=strdup(yytext); /*yyerror(yytext);*/}
<<EOF>>                       { yyterminate(); return END; }

%%

int yywrap(void){
  return 1;
}
