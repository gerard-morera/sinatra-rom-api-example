require "rom-repository"

module Purchases
  module Repositories
    class Get < ROM::Repository[:purchases]
      include Enumerable

      def each(&block)
        purchases.as(::Purchases::Entity).each(&block)
      end
    end
  end
end
