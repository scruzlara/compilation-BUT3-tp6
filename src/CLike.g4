grammar CLike;

// Parser rules
program: stmt*;

stmt
    : varDecl
    | assignmentStmt
    | ifStmt
    | whileStmt
    | exprStmt
    ;

varDecl: 'int' ID '=' expr ';' ;
assignmentStmt: ID '=' expr ';' ;
ifStmt: 'if' '(' expr ')' stmtBlock ('else' stmtBlock)? ;
whileStmt: 'while' '(' expr ')' stmtBlock ;
exprStmt: expr ';' ;

stmtBlock: '{' stmt* '}' ;

expr
    : expr op=('*'|'/') expr    # MulDivExpr
    | expr op=('+'|'-') expr    # AddSubExpr
    | expr op=('>'|'<') expr     # RelationalExpr
    | '(' expr ')'              # ParenExpr
    | ID                        # IdExpr
    | NUMBER                    # NumberExpr
    ;

// Lexer rules
ID: [a-zA-Z_][a-zA-Z0-9_]* ;
NUMBER: [0-9]+ ;
WS: [ \t\r\n]+ -> skip ;
