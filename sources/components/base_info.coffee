Request = require './request.coffee'
SimilarSites = require './similar_sites.coffee'

class BaseInfo extends Request

  templateHeader: _.template( $('#page-header').html() )
  template: _.template( $('#base-info').html() )

  constructor: ->
    @query()

  searchRequest: (query) ->
    @domain = query
    @query()

  success: (json) ->
    $('.page-header').remove()
    $(@CONTAINER_ID).empty()

    json.Domain = @domain

    @renderHeader(@domain)
    @render(json)
    @renderSimilarSites(json)

  renderHeader: (value) ->
    $('body').prepend( @templateHeader( domain: value ) )

  render: (json) ->
    $(@CONTAINER_ID).append( @template(json) )

  renderSimilarSites: (json) ->
    new SimilarSites(json.SimilarSites)


module.exports = BaseInfo