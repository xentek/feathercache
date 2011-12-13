root = global ? window
root.FeatherCache = class FeatherCache 
  constructor: (options) ->
    @key_prefix = options.key_prefix
    @store = root.localStorage
    
  set: (key, value) ->
    json_value = JSON.stringify(value)
    @store.setItem(key, json_value)
    return json_value
  
  get: (key) ->
    value = @store.getItem(key)
    return JSON.parse value

  del: (key) ->
    @store.removeItem(key)
    null

  nuke: ->
    @store.clear()
    null

  fetch: (key, source) ->
    data = ($.getJSON 'http://graph.facebook.com/nggyu')
    response = data.responseText
    @set(key,response)
    response
