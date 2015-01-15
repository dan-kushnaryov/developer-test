BaseInfo = require './components/base_info.coffee'
baseInfo = new BaseInfo()

$( document ).on "keyup", "input.search-input", (event) ->
  if event.which == 13
    baseInfo.searchRequest event.target.value

$( document ).on "click", "li.similar-site", (event) ->
  baseInfo.searchRequest $('span', this).text()
