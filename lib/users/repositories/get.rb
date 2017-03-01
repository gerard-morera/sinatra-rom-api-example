require "rom-repository"

module Users
  module Repositories
    class Get < ROM::Repository[:users]
      relations :purchases

      def by_id(id)
        users.by_id(id)
      end
    end
  end
end
