[![Build Status](https://travis-ci.org/mattSpell/hot-or-not.svg?branch=master)](https://travis-ci.org/mattSpell/hot-or-not)
[![Test Coverage](https://codeclimate.com/github/mattSpell/hot-or-not/badges/coverage.svg)](https://codeclimate.com/github/mattSpell/hot-or-not)
#Hot or Not: Nashville Home Edition

This is my Ruby/Rails capstone project for Nashville Software School.
The app is a real estate game where you choose Nashville home listings that you think are hot or not.
The ones that you mark as "hot" get saved as favorites.
You can then view your favorites and delete them.
You can play if you're a serious home shopper or just for fun!

### Usage:
Clone this repo, copy the config/application.yml.example, rename it to
application.yml and put in your facebook/twitter keys/secrets.
These keys can be obtained at https://developers.facebook.com/ and https://dev.twitter.com/.
Please note that the method to scrape the web for home listings is in a rake task which I have set up on Heroku scheduler.

### Technologies used:
- Ruby 2.1.2
- AJAX
- Nokogiri
- open-uri
- Sass/Bourbon/Bitters/Neat
- Devise/OmniAuth
- RSpec/Capybara/VCR/Webmock



### License
The MIT License (MIT)

Copyright (c) 2014 Matthew Spell

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
