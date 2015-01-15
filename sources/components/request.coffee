Config = require './config.coffee'

class Request extends Config

  getUrl: ->
    "http://api.similarweb.com/site/#{@domain}/rankoverview?userkey=a6fd04d833f2c28ce7c30dc957bf481e&format=json"

  query: ->
    $.ajax
      url: @getUrl()
      type: 'GET'
      dataType: 'json'
      context: @
      success: @success
      error: (jqXHR, textStatus, errorThrown) ->
        alert('Your search returned no results')
        console.log('Error: ')
        console.log(jqXHR)

module.exports = Request
