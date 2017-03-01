module Seasons
  class Relation < ROM::Relation[:sql]
    schema(:seasons, infer: true) do
      associations do
        has_many :episodes
      end
    end

    def by_id(id)
      where(id: id)
    end
  end
end 