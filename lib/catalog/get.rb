module Catalog
  class Get
    include Enumerable

    def initialize(seasons_repo = SeasonsGetRepo, movies_repo = MoviesGetRepo)
      @seasons_repo = seasons_repo
      @movies_repo  = movies_repo
    end

    def each(&block)
      (seasons_repo.to_a + movies_repo.to_a).each(&block)
    end

    private

    attr_reader :movies_repo, :seasons_repo
  end
end