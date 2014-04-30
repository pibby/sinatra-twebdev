# Twebdev - Tweet Aggregator based on Hash Tags - Responsive Web App written in Ruby and powered by Sinatra and Slim

Provide an array of hash tags in `app.rb` to search Twitter for, and this web app will grab the 15 most recent (or most popular by visiting the /popular route) tweets and cache them for 5 minutes. You can click on links, usernames, and hash tags in each tweet, and the author and tweet time are displayed (US - Central Time, which can be changed in `app.rb`). Clicking the author's name will take you directly to the tweet on Twitter.com so you can reply, retweet or favorite.

## Requirements
- Heroku account
- Twitter account
- Register a Twitter app at [http://app.twitter.com](http://app.twitter.com) so you can obtain your API credentials
- Heroku add-on:
    - [Heroku MemCachier](https://addons.heroku.com/marketplace/memcachier)

## Notes
Store all of your account info in the `.env` file for Twitter's API and Heroku's MemCachier. The dotenv gem will read your configuration settings from there.

This page is responsive, check it out on your phone or tablet as well!

## Screenshot
![Screenshot of Twebdev by @pibby powered by Sinatra](http://i.imgur.com/lbCB2nt.png)

## Get In Touch
Twitter: [@pibby](http://www.twitter.com/pibby)

## Thanks
- [Sinatra](http://www.sinatrarb.com/)
- [Slim](http://slim-lang.com/)
- [Heroku](http://www.heroku.com)
- The wonderful front-end web development community on Twitter