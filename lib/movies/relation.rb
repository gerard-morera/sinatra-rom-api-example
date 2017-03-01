module Movies
  class Relation < ROM::Relation[:sql]
    schema(:movies, infer: true)

    def by_id(id)
      where(id: id)
    end
  end
end