(function() {
  /*
  FeatherCache v0.3
  Released under the MIT License
  Copyright (c) 2011 Eric Marden
  More Info: http://github.com/xentek/feathercache
  */
  var FeatherCache, root;
  root = typeof global !== "undefined" && global !== null ? global : window;
  root.FeatherCache = FeatherCache = (function() {
    function FeatherCache(options) {
      this.key_prefix = options.key_prefix;
      this.store = root.localStorage;
    }
    FeatherCache.prototype.set = function(key, value) {
      var json_value;
      json_value = JSON.stringify(value);
      this.store.setItem(key, json_value);
      return json_value;
    };
    FeatherCache.prototype.get = function(key) {
      var value;
      value = this.store.getItem(key);
      return JSON.parse(value);
    };
    FeatherCache.prototype.del = function(key) {
      this.store.removeItem(key);
      return null;
    };
    FeatherCache.prototype.nuke = function() {
      this.store.clear();
      return null;
    };
    FeatherCache.prototype.fetch = function(key, source) {
      var data;
      data = $.ajax(source, {
        async: false,
        dataType: 'json',
        type: 'get'
      });
      this.store.setItem(key, data.responseText);
      return data.responseText;
    };
    return FeatherCache;
  })();
}).call(this);
