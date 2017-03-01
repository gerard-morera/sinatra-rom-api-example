require 'json'

module Seasons
  class Serializer < BaseSerializer
    def initialize(seasons)
      @collection = seasons
    end

    private

    def to_h(season)
      {
        'Title'    => season.title,
        'Plot'     => season.plot,
        'Episodes' => episodes_serializer(sorted_episodes(season.episodes)).as_json
      }
    end

    def sorted_episodes(episodes)
      episodes.sort_by(&:episode_number)
    end

    def episodes_serializer(episodes)
      BaseSerializer.new(episodes)
    end

    attr_reader :collection, :episodes_serializer_klass
  end
end