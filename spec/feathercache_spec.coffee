describe 'FeatherCache', ->

  beforeEach ->
    localStorage.clear()
    @fc = new FeatherCache({key_prefix: 'xen:'})
    @response = { status: 200, responseText: {"id": "31392432135","name": "Never Gonna Give You Up","picture": "http://profile.ak.fbcdn.net/hprofile-ak-snc4/50495_31392432135_7012_s.jpg","link": "http://www.facebook.com/nggyu","likes": 62767,"category": "Movies/music","website": "http://rickrolling.com","username": "nggyu","founded": "Rick Astley","talking_about_count": 9} }
    spyOn($,'getJSON').andReturn(@response)

  it "should set options when instantiated", ->
    (expect @fc.key_prefix).toBe('xen:')
  
  it "should be able to set key/values", ->
    value = @fc.set 'key', 'value' 
    (expect value).toBe('"value"')
  
  it "should jsonify complex values when setting them", ->
    complex_value = @fc.set 'key', [{user: '1', name: 'Fry'},{user: '1', name: 'Leela'}]
    (expect complex_value).toBe('[{"user":"1","name":"Fry"},{"user":"1","name":"Leela"}]')
  
  it "should retrieve values that have been set", ->
    @fc.set('key','value')
    value = @fc.get('key')
    (expect value).toBe('value')

  it "should remove items that have been set", ->
    @fc.set('key', 'value')
    @fc.del('key')
    (expect @fc.get('key')).toBe(null)
  
  it "should remove all items", ->
    @fc.set('key1','value1')
    @fc.set('key2','value2')
    @fc.nuke()
    (expect @fc.get('key1')).toBe(null)
    (expect @fc.get('key2')).toBe(null)  

  it "should fetch items from a json api", ->
    api_data = @fc.fetch('nggyu', 'http://graph.facebook.com/nggyu')
    (expect $.getJSON).toHaveBeenCalledWith('http://graph.facebook.com/nggyu')

  it "should return responseText", ->
    api_data = @fc.fetch('nggyu', 'http://graph.facebook.com/nggyu')
    (expect api_data.name).toBe('Never Gonna Give You Up')

  it "should fetch and store data from a json api", ->
    api_data = @fc.fetch('nggyu', 'http://graph.facebook.com/nggyu')
    (expect (@fc.get 'nggyu').founded).toBe('Rick Astley')
    
