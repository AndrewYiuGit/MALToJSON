## README

This is a service that will return the MAL search results in JSON instead of XML. At the moment it simply parses the XML and reformats it in JSON, but there are more features planned. The app has 1 static page at the root URL and a 404 image. It is meant to be used as an API.

## Enpoints

`/anime/search?title=<title>` - Get a list of animes equal or similar to `<title>`

## Planned Features

Features to come include:
* Search suggestions \("Did you mean ..."\)
* Related titles
* ...

## How to run locally

To get a local version running:
* Clone application
* Bundle install
* Run `rails server
