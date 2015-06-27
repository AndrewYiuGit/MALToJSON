require 'httparty'
class AnimeController < ApplicationController
    include HTTParty

    def log_response(response)
        puts "============ Code ============"
        puts response.code
        puts "============ Body ============"
        puts response.body
    end

    def get_anime_by_title(title)
        search_uri = URI('http://myanimelist.net/api/anime/search.xml')
        auth = {
            :username => APP_CONFIG['mal_username'],
            :password => APP_CONFIG['mal_password']
        }
        search_uri.query = {"q" => title}.to_query
        return HTTParty.get(search_uri.to_s, :basic_auth => auth)
    end

    def search
        json_response = {}
        if params.has_key?(:title)
            response = get_anime_by_title(params[:title])
            if response.code == 200
                json_response = Hash.from_xml(response.body)
            else
                log_response(response)
                json_response[:statusCode] = response.code
                json_response[:errorMessage] = response.body
            end
        else
            json_response[:statusCode] = 404
            json_response[:errorMessage] = "Missing params: title"
        end

        render json: json_response.to_json, status: json_response[:statusCode]
    end
end
