class Config

  CONTAINER_ID: '#container'
  domain: 'amazon.com'

  setDomain: (domain) ->
    @domain = domain if domain

module.exports = Config