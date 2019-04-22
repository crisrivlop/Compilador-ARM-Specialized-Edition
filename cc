#!/bin/bash


rm -rf debug
lex armlexer.l
yacc -d armparser.y
mkdir debug
mv lex.yy.c debug/lex.yy.c
mv y.tab.h debug/y.tab.h
mv y.tab.c debug/y.tab.c
cd debug
g++ -std=c++11 -c lex.yy.c
g++ -std=c++11 -c y.tab.c
g++ -std=c++11 lex.yy.o y.tab.o -o ../arm-compiler
chmod +x ../arm-compiler
cd ../
rm -rf debug
