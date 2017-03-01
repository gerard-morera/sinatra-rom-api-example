require "rom-repository"

module Users
  module Repositories
    class Create < ROM::Repository[:users]
      commands :create
    end
  end
end
