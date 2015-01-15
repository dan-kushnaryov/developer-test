module.exports = (grunt) ->
  # Load all grunt-* related tasks
  require('matchdep').filterDev('grunt-*').forEach grunt.loadNpmTasks

  grunt.initConfig

    clean:
      dist: 'dist/*'

    copy:
      bower:
        expand: true
        src: ['bower_components/**/*', 'assets/*']
        dest: 'dist'
      static:
        files:
          'dist/index.html' : ['index.html']

    coffeeify:
      options:
        detectGlobals: true,
        ignoreMissing: false,
        debug: true
      files:
        src: ['sources/**/*.coffee'],
        dest:'dist/main.js'

    stylus:
      compile:
        files:
          'dist/main.css' : 'sources/main.styl'

    watch:
      scripts:
        files: ['**/*.coffee', '**/*.styl']
        tasks: ['coffeeify', 'stylus']
      styl:
        files: ['**/*.styl']
        tasks: 'stylus'

    connect:
      example:
        port: 1337
        base: './dist'

  grunt.registerTask 'default', ['build']
  grunt.registerTask 'styles', ['stylus']
  grunt.registerTask 'watch', ['build', 'watch']
  grunt.registerTask 'build', ['clean', 'stylus', 'coffeeify', 'copy', 'connect:example']