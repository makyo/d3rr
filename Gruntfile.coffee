module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-jison'

  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')
    uglify:
      options:
        banner: '/*! d3rr <%= grunt.template.today("yyyy-mm-dd") %> */\n'
      build:
        src: 'd3rr.js'
        dest: 'd3rr.min.js'
    jison:
      bnf:
        options:
          moduleName: 'grammar_bnf'
        files:
          'build/grammar-bnf.js': 'grammars/bnf.jison'
    coffee:
      'build/main.js': ['src/parsers.litcoffee', 'src/d3rr.litcoffee']
      options:
        join: true
        bare: true
        joinExt: '.src.litcoffee'
    concat:
      dist:
        src: ['build/grammar*.js', 'build/main.js']
        dest: 'd3rr.js'
      options:
        banner: 'var d3rr = (function(){'
        footer: '})()'
    watch:
      files: ['src/*.litcoffee', 'grammars/*.jison']
      tasks: ['build']

  grunt.registerTask 'build', ['coffee', 'jison', 'concat', 'uglify']

  grunt.registerTask 'default', ['build']
