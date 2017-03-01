describe Seasons::Entity do
  let(:episode_1) { double(:episode_1, to_h: 'ep1') }
  let(:episode_2) { double(:episode_2, to_h: 'ep2') }

  let(:opts) do
    {
      title:      double(:title), 
      plot:       double(:plot), 
      created_at: double(:created_at), 
      episodes:   [episode_1, episode_2], 
    }
  end

  subject { described_class.new(opts) }

  describe '#episodes' do
    before(:each) do
      allow(Episodes::Entity).to receive(:new).with('ep1').and_return('ep1')
      allow(Episodes::Entity).to receive(:new).with('ep2').and_return('ep2')
    end

    it 'provides the episodes' do
      expect(subject.episodes).to eq(['ep1', 'ep2'])
    end
  end

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