The grammars understood by `d3rr` are standard BNF and EBNF grammars. More may be added later.

    class Parser
      constructor: () ->
        @grammar = @parser.parse(@text)
        debugger;

    class BNFParser extends Parser
      constructor: (@text) ->
        @parser = grammar_bnf
        super()

      generateSVG: ->
        return

    class EBNFParser extends Parser
      constructor: (@text) ->
        parser =
          parse: (text) -> text

      generateSVG: ->
        return

    parsers =
      bnf: BNFParser
      #ebnf: EBNFParser
