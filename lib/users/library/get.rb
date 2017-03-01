module Users
  module Library
    class Get
      include Enumerable

      def initialize(params)
        @user_id = params.fetch('user_id')
      end

      def each(&block)
        UsersGetPurchaseBytTimeContrainRepo.each(user_id, time_constrain, &block)
      end

      private

      def time_constrain
        Time.new - Purchases::Entity::LIFETIME
      end

      attr_reader :user_id
    end
  end
end