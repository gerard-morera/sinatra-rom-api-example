module Users
  class Entity
    def initialize(opts)
      @mail = opts.fetch(:mail)
    end

    attr_reader :mail
  end
end