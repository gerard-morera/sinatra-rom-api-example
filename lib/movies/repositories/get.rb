require "rom-repository"

module Movies
  module Repositories
    class Get < ROM::Repository[:movies]
      include Enumerable

      def each(&block)
        movies.as(::Movies::Entity).each(&block)
      end

      def by_id(id)
      	movies.by_id(id).as(::Movies::Entity)
      end
    end
  end
end