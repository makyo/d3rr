module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')
    uglify:
      options:
        banner: '/*! d3rr <%= grunt.template.today("yyyy-mm-dd") %> */\n'
      build:
        src: 'd3rr.js'
        dest: 'd3rr.min.js'
    coffee:
      'd3rr.js': ['src/grammar.litcoffee', 'src/d3rr.litcoffee']
      options:
        join: true
        joinExt: '.src.litcoffee'
    watch:
      files: 'src/*.litcoffee'
      tasks: ['coffee', 'uglify']

  grunt.registerTask 'default', ['watch']
