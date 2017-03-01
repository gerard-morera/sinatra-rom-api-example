module Purchases
  module Builder
    class Season
      def initialize(params)
        @user_id       = params.fetch('user_id')
        @season_id     = params.fetch('season_id')
        @video_quality = params.fetch('video_quality')
      end

      def perform
        PurchasesCreateRepo.create_with_user(user, purchase_changeset)
      end

      private

      def user
        UsersGetRepo.by_id(user_id).one
      end
      
      def purchase_changeset
        PurchasesCreateRepo.changeset(required_params).map(:add_timestamps)
      end

      def required_params
        {
          target_type:  'season',
          target_id:     season_id.to_i,
          video_quality: video_quality
        } 
      end

      attr_reader :season_id, :user_id, :video_quality
    end
  end
end
