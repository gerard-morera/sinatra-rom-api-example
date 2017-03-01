module Seasons
  class Entity
    def initialize(opts)
      @title 			= opts.fetch(:title)
      @plot  			= opts.fetch(:plot)
      @created_at = opts.fetch(:created_at)
      @episodes   = opts.fetch(:episodes, [])
    end

    def episodes
    	@episodes.map { |episode| episode_entity(episode.to_h) }
    end

    attr_reader :title, :plot, :created_at

    private

    def episode_entity(episode)
    	Episodes::Entity.new(episode)
    end
  end
end
