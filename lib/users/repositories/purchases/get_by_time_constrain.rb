module Users
  module Repositories
    module Purchases
      class GetByTimeContrain < ROM::Repository[:purchases]
        include Enumerable

        def each(user_id, time_constrain, &block)
          purchases.by_user_id_and_time_constrain(user_id, time_constrain).as(::Purchases::Entity).each(&block)
        end
      end
    end
  end
end


