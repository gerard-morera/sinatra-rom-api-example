describe Seasons::Repositories::Get do
  let(:config) { double(:config, relation: []) }
  
  let(:seasons_entities) { ['season_1', 'season_3', 'season_2'] }
  let(:season_1_entity) { double(:season_1_entity) }
  
  let(:season) { double(:season, as: season_1_entity, by_id: ['season_1']) }
  let(:seasons) { double(:seasons, as: seasons_entities, by_id: season) }

  subject { described_class.new(config) }

  describe '#each' do
    it 'returns an iteretable seasons object' do
      expect(subject).to receive(:aggregate).and_return(seasons)

      expect(subject.sort).to eq ["season_1", "season_2", "season_3"]
    end
  end

  describe '#by_id' do
    it 'retrieves the season of the id provided' do
      expect(subject).to receive(:seasons).and_return(seasons)
      expect(subject.by_id(1)).to eq season_1_entity
    end
  end
end
