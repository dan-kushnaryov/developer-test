Config = require './config.coffee'

class SimilarSites extends Config

  template: _.template( $('#similar-sites').html() )

  constructor: (images) ->

    $('.preloader').show()
    $('.similar-sites-block dl').hide()

    countImages = images.length

    columns = [[], [], []]

    _.each images, (img, index) ->
      columnIndex = ++index % 3
      columns[columnIndex].push(img)

    html = @template( similarSites: columns )
    $(@CONTAINER_ID).append( html )

    i = 0
    $('img', html).on 'load', ->

      if countImages is ++i
        $('.preloader').hide()
        $('.similar-sites-block dl').fadeIn()

module.exports = SimilarSites

