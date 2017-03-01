describe BaseSerializer do
  let(:test_class) { Class.new(BaseSerializer) }

  let(:item_1) { double 'item_1', :title => "foo", :plot => "bar" }
  let(:item_2) { double 'item_2', :title => "baz", :plot => "qux" }

  let(:collection) { [item_1, item_2] }

  subject { test_class.new(collection) }

  describe '#to_json' do
    let :expected_as_json do
      [{'title' => 'foo', 'plot' => 'bar'},
       {'title' => 'baz', 'plot' => 'qux'}]
    end

    it 'serializes properly' do
      expect(JSON.parse(subject.to_json)).to eq expected_as_json
    end
  end
end