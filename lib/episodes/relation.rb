module Episodes
  class Relation < ROM::Relation[:sql]
    schema(:episodes, infer: true) do  
      associations do
        belongs_to :season
      end
    end
  end
end
