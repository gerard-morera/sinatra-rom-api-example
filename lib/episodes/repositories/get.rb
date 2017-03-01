require "rom-repository"

module Episodes
  module Repositories
    class Get < ROM::Repository[:episodes]
      include Enumerable

      def each(&block)
        episodes.as(::Episodes::Entity).each(&block)
      end
    end
  end
end