require "rom-repository"

module Seasons
  module Repositories
    class Get < ROM::Repository[:seasons]
      include Enumerable

      relations :episodes

      def each(&block)
        aggregate(:episodes).as(::Seasons::Entity).each(&block)
      end

      def by_id(id)
      	seasons.by_id(id).as(::Seasons::Entity)
      end
    end
  end
end