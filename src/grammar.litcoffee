The grammars understood by `d3rr` are standard BNF and EBNF grammars. More may be added later.

    class GrammarParser
      constructor: (@text) ->
        @productions = []

    class BNFParser extends GrammarParser
      generateSVG: ->
        return

    class EBNFParser extends GrammarParser
      generateSVG: ->
        return

    grammars =
      bnf: BNFParser
      ebnf: EBNFParser
