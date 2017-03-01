require "rom-repository"

module Movies
  module Repositories
    class Create < ROM::Repository[:movies]
      commands :create
    end
  end
end
