require 'httparty'
class AnimeController < ApplicationController
    include HTTParty

    def log_response(response)
        puts "===================================== Code ====================================="
        puts response.code
        puts "===================================== Body ====================================="
        puts response.body
    end

    def search
        # TODO: Fill these fields with credentials to do basic auth on MAL
        auth = {
            :username => APP_CONFIG['mal_username'],
            :password => APP_CONFIG['mal_password']
        }
        anime_search_uri = 'http://myanimelist.net/api/anime/search.xml'
        anime_name = params[:title]

        search_uri = URI(anime_search_uri)
        search_uri.query = {"q" => anime_name}.to_query
        anime_search_req = search_uri.to_s

        response = HTTParty.get(anime_search_req, :basic_auth => auth)
        json_response = {}.to_json
        if response.code == 200
            json_response = Hash.from_xml(response.body).to_json
        else
            log_response(response)
        end
        render json: json_response
    end
end
