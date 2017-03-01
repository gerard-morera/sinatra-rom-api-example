require "rom-repository"

module Episodes
  module Repositories
    class Create < ROM::Repository[:episodes]
      commands :create
    end
  end
end
