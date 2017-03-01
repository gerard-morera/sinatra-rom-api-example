require 'json'

module Library
  class Serializer < BaseSerializer
    def initialize(collection)
      @collection = collection
    end

    private

    def to_h(purchase)
      {
        title:         purchase.title,
        video_quality: purchase.video_quality,
        purchase_date: purchase.created_at,
      }
    end

    attr_reader :collection
  end
end