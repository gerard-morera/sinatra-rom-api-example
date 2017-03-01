require "rom-repository"

module Purchases
  module Repositories
    class Create < ROM::Repository[:purchases]
      commands :create

      def create_with_user(user, purchase_changeset)
        transaction do
          create(purchase_changeset.associate(user, :users))
        end
      end
    end
  end
end
