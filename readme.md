# ☁ Feather Cache v0.1

A super-lightweight json cache for your mobile web apps.

## Features 
  - Provides a thin wrapper around html5 localStorage.
  - Written in coffescript **☕**
  - Fully unit tested with jasmine

## Requirements
  - jQuery 1.4+

## Install
 - Include feathercache.js in your webpage. 
 - Ensure that jQuery is already included on the page, or `FeatherCache#fetch` won't work for you.

## Usage
  
````
fc = FeatherCache({key_prefix: 'feather:'});

fc.set('key','value');
fc.get('key');

fc.fetch('nggyu','http://graph.facebook.com/nggyu');
nggyu = fc.get('nggyu');
console.log('nggyu');
````

## Contributing

 - Fork the repository
 - Change the code, and send a pull request
 - Bonus points for adding specs for the new feature/bug fix!
 - Or just [submit an issue](https://github.com/xentek/feathercache/issues) and I'll see what I can do

## License

Copyright (c) 2011 Eric Marden 

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
