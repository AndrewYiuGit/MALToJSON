require 'httparty'
class AnimeController < ApplicationController
    include HTTParty

    def search
        # TODO: Fill these fields with credentials to do basic auth on MAL
        auth = {:username => "", :password => ""}
        anime_search_uri = 'http://myanimelist.net/api/anime/search.xml'
        anime_name = params[:title]

        search_uri = URI(anime_search_uri)
        search_uri.query = {"q" => anime_name}.to_query
        anime_search_req = search_uri.to_s

        response = HTTParty.get(anime_search_req, :basic_auth => auth)
        render json: Hash.from_xml(response.body).to_json
    end
end
