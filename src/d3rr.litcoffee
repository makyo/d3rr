`d3rr` is intended to allow one to include railroad diagrams on one's page with only the EBNF at hand.  One can simply drop one's EBNF grammars in divs (or whatever) classed with `ebnf`, include the script on the page, and call `run`. `d3rr` will parse the EBNF contained in each block and replace it with an SVG of the railroad diagram. More than that, though, it can generate a standalone SVG acceptable for saving and using elsewhere.

    class d3rr
      constructor: (config) ->
        {@grammarSelector = '.d3rr-grammar'} = config

      grammar2svg: (el, grammar, type) ->
        parser = grammars[type]
        el.attr
          width: 100
          height: 100
        el.append 'text'
          .text grammar
          .attr
            x: 0
            y: 16

`d3rr.run` will, when invoked, search for any tag with the class `ebnf`, grab its contents (assuming that they're a recognized grammer), parse them, generate an SVG of a railroad diagram, and replaces the contents of the tag with the generated svg.

      run: () ->
        self = @
        grammarBlocks = d3.selectAll @grammarSelector
        grammarBlocks.each () ->
          el = d3.select @
          grammar = el.text()
          type = el.attr('data-type') ? 'bnf'
          el.html '<svg class="d3rr"></svg>'
          rr = self.grammar2svg el.select('.d3rr'), grammar, type

The only object made publicly available is `d3rr`

    window.d3rr = d3rr
