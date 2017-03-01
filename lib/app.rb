require 'pry'

require 'digest/md5'
require 'sinatra/base'
require 'sinatra/param'
require "rom-sql"
require "rom-repository"

require_relative './movies/entity'
require_relative './seasons/entity'
require_relative './episodes/entity'
require_relative './users/entity'
require_relative './purchases/entity'

require_relative './utils/base_serializer'
require_relative './seasons/serializer'
require_relative './library/serializer'

require_relative './catalog/get'
require_relative './users/library/get'

require_relative './purchases/builder/movie'
require_relative './purchases/builder/season'

require_relative './purchases/repositories/create'
require_relative './purchases/repositories/get'

require_relative './movies/repositories/create'
require_relative './movies/repositories/get'

require_relative './seasons/repositories/create'
require_relative './seasons/repositories/get'

require_relative './episodes/repositories/create'
require_relative './episodes/repositories/get'

require_relative './users/repositories/create'
require_relative './users/repositories/get'
require_relative './users/repositories/purchases/get_by_time_constrain'

require_relative './movies/relation'
require_relative './seasons/relation'
require_relative './episodes/relation'
require_relative './users/relation'
require_relative './purchases/relation'

require_relative '../db/migrations'
require_relative '../db/rom/setup'
require_relative '../db/redis'

require_relative '../db/rom/populate_database' #For testing purposes

class App < Sinatra::Base
  helpers Sinatra::Param

  EXPIRES_DEFAULT_TIME = 60 * 60 * 12

  get '/movies' do
    movies_json = BaseSerializer.new(MoviesGetRepo.sort_by(&:created_at)).to_json

    expires(EXPIRES_DEFAULT_TIME)
    etag Digest::MD5.hexdigest(movies_json)

    movies_json
  end

  get '/seasons' do
    seasons_json = Seasons::Serializer.new(SeasonsGetRepo.sort_by(&:created_at)).to_json

    expires(EXPIRES_DEFAULT_TIME)
    etag Digest::MD5.hexdigest(seasons_json)

    seasons_json
  end

  get '/' do
    catalog_json = BaseSerializer.new(Catalog::Get.new.sort_by(&:created_at)).to_json

    expires(EXPIRES_DEFAULT_TIME)
    etag Digest::MD5.hexdigest(catalog_json)

    catalog_json
  end

  get '/library' do
    param :user_id, String, required: true

    library_json = Library::Serializer.new(Users::Library::Get.new(params).sort_by(&:created_at)).to_json
    etag Digest::MD5.hexdigest(library_json)

    library_json
  end

  post '/purchase' do
    param :movie_id,       String, blank: false
    param :season_id,      String, blank: false
    param :user_id,        String, blank: false, required: true
    param :video_quality,  String, blank: false, required: true

    any_of :movie_id, :season_id

    if(params['movie_id'])
      Purchases::Builder::Movie.new(params).perform
    elsif(params['season_id'])
      Purchases::Builder::Season.new(params).perform
    end
  end
end