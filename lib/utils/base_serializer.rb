require 'json'

class BaseSerializer
  def initialize(collection)
    @collection = collection
  end

  def to_json
    as_json.to_json
  end

  def as_json
    collection.map { |element| to_h(element) }
  end

  private

  def to_h(element)
    { 'title' => element.title, 'plot' => element.plot }
  end

  attr_reader :collection
end
