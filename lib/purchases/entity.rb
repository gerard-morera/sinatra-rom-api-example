module Purchases
  class Entity
    extend Forwardable

    LIFETIME = 60 * 60 * 24 * 2

    def_delegators :category, :title, :plot

    attr_reader :created_at, :video_quality

    def initialize(opts)
      @target_type   = opts.fetch(:target_type)
      @target_id     = opts.fetch(:target_id)
      @created_at    = opts.fetch(:created_at)
      @video_quality = opts.fetch(:video_quality)
    end

    def category
      if(target_type) == 'movie'
        MoviesGetRepo.by_id(target_id).one
      elsif(target_type) == 'season'
        SeasonsGetRepo.by_id(target_id).one
      end
    end

    private

    attr_reader :target_type, :target_id
  end
end