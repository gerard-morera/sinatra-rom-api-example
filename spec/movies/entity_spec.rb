describe Movies::Entity do
  let(:opts) do
    {
      title:      double(:title), 
      plot:       double(:plot), 
      created_at: double(:created_at), 
    }
  end

  subject { described_class.new(opts) }

  describe '#title' do
    it 'has a tilte property' do
      expect(subject.title).to be_truthy
    end
  end

  describe '#plot' do
    it 'has a plot property' do
      expect(subject.plot).to be_truthy
    end
  end

  describe '#created_at' do
    it 'has a created_at property' do
      expect(subject.created_at).to be_truthy
    end
  end
end