module Movies
  class Entity
    def initialize(opts)
      @title = opts.fetch(:title, 'no title')
      @plot  = opts.fetch(:plot, 'no plot')
      @created_at = opts.fetch(:created_at)
    end

    attr_reader :title, :plot, :created_at
  end
end