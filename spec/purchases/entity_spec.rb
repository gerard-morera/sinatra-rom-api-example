describe Purchases::Entity do
  let(:opts) do
    {
      target_id:      1, 
      target_type:    'movie', 
      created_at:     'some date', 
      video_quality:  'HD'
    }
  end

  subject { described_class.new(opts) }

  describe '#category' do
    context 'when is a movie' do
      let(:movie)      { double(:movie) }
      let(:movies_repo) { double(:movies_repo, one: movie) }

      before(:each) do
        allow(MoviesGetRepo).to receive(:by_id).and_return(movies_repo)
      end
      it 'provides a movie' do
        expect(subject.category).to eq movie
      end
    end
    context 'when is a season' do
      let(:season)       { double(:season) }
      let(:seasons_repo) { double(:seasons_repo, one: season) }


      before(:each) do
        allow(SeasonsGetRepo).to receive(:by_id).and_return(seasons_repo)
        allow(subject).to receive(:target_type).and_return('season')
      end
      it 'provides a season' do
        expect(subject.category).to eq season
      end
    end

    describe '#title' do
      it 'has a tilte property' do
        expect(subject.category.title).to be_truthy
      end
    end

    describe '#video_quality' do
      it 'has a video_quality property' do
        expect(subject.video_quality).to be_truthy
      end
    end

    describe '#created_at' do
      it 'has a created_at property' do
        expect(subject.category.created_at).to be_truthy
      end
    end
  end
end