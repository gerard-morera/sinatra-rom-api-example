describe Episodes::Entity do
  let(:opts) do
    {
      title:          double(:title), 
      plot:           double(:plot), 
      created_at:     double(:created_at), 
      episode_number: double(:episode_number)
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

  describe '#episode_number' do
    it 'has a episode_number property' do
      expect(subject.episode_number).to be_truthy
    end
  end
end