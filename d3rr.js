(function() {
  var BNFParser, EBNFParser, GrammarParser, d3rr, grammars,
    extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  GrammarParser = (function() {
    function GrammarParser(text) {
      this.text = text;
      this.productions = [];
    }

    return GrammarParser;

  })();

  BNFParser = (function(superClass) {
    extend(BNFParser, superClass);

    function BNFParser() {
      return BNFParser.__super__.constructor.apply(this, arguments);
    }

    BNFParser.prototype.generateSVG = function() {};

    return BNFParser;

  })(GrammarParser);

  EBNFParser = (function(superClass) {
    extend(EBNFParser, superClass);

    function EBNFParser() {
      return EBNFParser.__super__.constructor.apply(this, arguments);
    }

    EBNFParser.prototype.generateSVG = function() {};

    return EBNFParser;

  })(GrammarParser);

  grammars = {
    bnf: BNFParser,
    ebnf: EBNFParser
  };

  d3rr = (function() {
    function d3rr(config) {
      var ref;
      this.grammarSelector = (ref = config.grammarSelector) != null ? ref : '.d3rr-grammar';
    }

    d3rr.prototype.grammar2svg = function(el, grammar, type) {
      var parser;
      parser = grammars[type];
      el.attr({
        width: 100,
        height: 100
      });
      return el.append('text').text(grammar).attr({
        x: 0,
        y: 16
      });
    };

    d3rr.prototype.run = function() {
      var grammarBlocks, self;
      self = this;
      grammarBlocks = d3.selectAll(this.grammarSelector);
      return grammarBlocks.each(function() {
        var el, grammar, ref, rr, type;
        el = d3.select(this);
        grammar = el.text();
        type = (ref = el.attr('data-type')) != null ? ref : 'bnf';
        el.html('<svg class="d3rr"></svg>');
        return rr = self.grammar2svg(el.select('.d3rr'), grammar, type);
      });
    };

    return d3rr;

  })();

  window.d3rr = d3rr;

}).call(this);
