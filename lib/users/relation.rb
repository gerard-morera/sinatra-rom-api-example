module Users
  class Relation < ROM::Relation[:sql]
    schema(:users, infer: true) do
      associations do
        has_many :purchases
      end
    end

    def by_id(id)
      where(id: id)
    end
  end
end