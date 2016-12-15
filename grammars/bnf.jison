/* Grammar for a very plain BNF format */

%lex
%%

\'([^']*)\'                return 'LITERAL'
\"([^"]*)\"                return 'LITERAL'
[a-zA-Z][a-zA-Z0-9_-]*     return 'IDENT'
"::="                      return '::='
"|"                        return '|'
<<EOF>>                    return 'EOF'
$                          return 'EOL'
\s+                        /* ignore whitespace */

/lex

%{
    function prependChild(node, child){
      node.splice(2,0,child);
      return node;
    }
    function stripQuotes(literal) {
      return literal.replace(/^['"](.*)['"]$/, '$1')
    }
%}

%start Grammar
%%

Grammar
    : Productions EOF
        {{ return $$; }}
    ;

Productions
    : Production
        {{ $$ = [$1]; }}
    | Production EOL Productions
        {{ $$ = prependChild($3, $1)}}
    ;

Production
    : IDENT "::=" Expression
        {{ $$ = {}; $$[$1] = $3; }}
    ;

Expression
    : List
        {{ $$ = $1; }}
    | List "|" Expression
        {{ $$ = {'OR': prependChild($3, 1)}; }}
    ;

List
    : Term
        { $$ = $1; }
    | Term List
        {{ $$ = prependChild($2, $1); }}
    ;

Term
    : LITERAL
        {{ $$ = {'atom': 'TERMINAL', 'value': stripQuotes($1)}; }}
    | IDENT
        {{ $$ = {'atom': 'NONTERMINAL', 'value': $1}; }}
    ;
