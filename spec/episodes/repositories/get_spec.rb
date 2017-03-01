describe Episodes::Repositories::Get do
  let(:config) { double(:config, relation: []) }
  let(:episodes_entities) { ['ep1', 'ep3', 'ep2'] }
  let(:episodes) { double(:episodes, as: episodes_entities) }

  subject { described_class.new(config) }

  describe '#each' do
    it 'returns an iteretable catalog' do
      expect(subject).to receive(:episodes).and_return(episodes)

      expect(subject.sort).to eq ["ep1", "ep2", "ep3"]
    end
  end
end