describe Movies::Repositories::Get do
  let(:config) { double(:config, relation: []) }
  
  let(:movies_entities) { ['movie_1', 'movie_3', 'movie_2'] }
  let(:movie_1_entity) { double(:movie_1_entity) }
  
  let(:movie) { double(:movie, as: movie_1_entity, by_id: ['movie_1']) }
  let(:movies) { double(:movies, as: movies_entities, by_id: movie) }

  subject { described_class.new(config) }

  describe '#each' do
    it 'returns an iteretable movies object' do
      expect(subject).to receive(:movies).and_return(movies)

      expect(subject.sort).to eq ["movie_1", "movie_2", "movie_3"]
    end
  end

  describe '#by_id' do
    it 'retrieves the movie od the id provided' do
      expect(subject).to receive(:movies).and_return(movies)
      expect(subject.by_id(1)).to eq movie_1_entity
    end
  end
end
