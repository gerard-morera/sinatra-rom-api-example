module Purchases
  class Relation < ROM::Relation[:sql]
    schema(:purchases, infer: true) do
      associations do
        belongs_to :user
      end
    end

    def by_user_id_and_time_constrain(user_id, time_constrain)
      purchases.where(user_id: user_id) { created_at > time_constrain }
    end
  end
end