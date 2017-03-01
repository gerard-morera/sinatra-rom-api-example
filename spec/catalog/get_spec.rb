require_relative '../../lib/catalog/get'

describe Catalog::Get do
  let(:seasons_repo) { double(:seaons_repo, to_a: [1, 3]) }
  let(:movies_repo) { double(:movies_repo, to_a: [2, 0]) }

  subject { described_class.new(seasons_repo, movies_repo) }

  describe '#each' do
    it 'returns an iteretable catalog' do
      expect(subject.sort).to eq([0, 1, 2, 3])
    end
  end
end