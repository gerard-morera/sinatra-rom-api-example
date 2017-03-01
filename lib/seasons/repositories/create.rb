require "rom-repository"

module Seasons
  module Repositories
    class Create < ROM::Repository[:seasons]
      commands :create

      relations :episodes
    end
  end
end
