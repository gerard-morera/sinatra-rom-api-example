module Episodes
  class Entity
    def initialize(opts)
      @title          = opts.fetch(:title)
      @plot           = opts.fetch(:plot)
      @created_at     = opts.fetch(:created_at)
      @episode_number = opts.fetch(:episode_number)
    end

    attr_reader :title, :plot, :episode_number
  end
end