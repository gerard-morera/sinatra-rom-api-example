require 'app'

describe App do
  include Rack::Test::Methods

  def app
    App
  end

  describe '/movies' do
    let(:movie_class) { Struct.new(:title, :plot) }

    let(:movie_1) { movie_class.new('The testing apocalipse', 'Test sex and drugs movie') }
    let(:movie_2) { movie_class.new('The testing redemption', 'Secuel around same topic') }
    let(:movies)  { [movie_1, movie_2] }

    let(:serializer) { double(:serializer) }

    let(:movies_json) do
      "[{\"title\":\"The testing apocalipse\",\"plot\":\"Test sex and drugs movie\"},{\"title\":\"The testing redemption\",\"plot\":\"Secuel around same topic\"}]"
    end

    before(:each) do
      allow(MoviesGetRepo).to receive(:sort_by).and_return(movies)
      allow(BaseSerializer).to receive(:new).with(movies).and_return(serializer)
      allow(serializer).to receive(:to_json).and_return(movies_json)
    end

    it 'retrives the movies' do
      get '/movies'
      expect(last_response).to be_ok
      expect(last_response.body).to eq(movies_json)
    end
  end

  describe '/seasons' do
    let(:season_class) { Struct.new(:title, :plot) }

    let(:season_1) { season_class.new('The testing apocalipse', 'Test sex and drugs season') }
    let(:season_2) { season_class.new('The testing redemption', 'Secuel around same topic') }
    let(:seasons)  { [season_1, season_2] }

    let(:serializer) { double(:serializer) }

    let(:seasons_json) do
      "[{\"title\":\"The testing apocalipse\",\"plot\":\"Test sex and drugs movie\"},{\"title\":\"The testing redemption\",\"plot\":\"Secuel around same topic\"}]"
    end

    before(:each) do
      allow(SeasonsGetRepo).to receive(:sort_by).and_return(seasons)
      allow(Seasons::Serializer).to receive(:new).with(seasons).and_return(serializer)
      allow(serializer).to receive(:to_json).and_return(seasons_json)
    end

    it 'retrives the seasons' do
      get '/seasons'
      expect(last_response).to be_ok
      expect(last_response.body).to eq(seasons_json)
    end
  end

  describe '/' do
    let(:content_class) { Struct.new(:title, :plot) }

    let(:content_1) { content_class.new('The testing apocalipse', 'Test sex and drugs content') }
    let(:content_2) { content_class.new('The testing redemption', 'Secuel around same topic') }
    let(:contents)  { [content_1, content_2] }

    let(:serializer) { double(:serializer) }
    let(:catalog)    { double(:catalog) }

    let(:contents_json) do
      "[{\"title\":\"The testing apocalipse\",\"plot\":\"Test sex and drugs movie\"},{\"title\":\"The testing redemption\",\"plot\":\"Secuel around same topic\"}]"
    end

    before(:each) do
      allow(Catalog::Get).to receive(:new).and_return(catalog)
      allow(catalog).to receive(:sort_by).and_return(contents)
      allow(BaseSerializer).to receive(:new).with(contents).and_return(serializer)
      allow(serializer).to receive(:to_json).and_return(contents_json)
    end

    it 'retrives the contents' do
      get '/'
      expect(last_response).to be_ok
      expect(last_response.body).to eq(contents_json)
    end
  end

  describe '/library' do
    let(:content_class) { Struct.new(:title, :video_quality, :purchase_date) }

    let(:purchase_1) { content_class.new('The testing apocalipse', 'HD', 'fake_date') }
    let(:purchase_2) { content_class.new('The testing redemption', 'HD', 'fake_date') }
    let(:purchases)  { [purchase_1, purchase_2] }

    let(:serializer) { double(:serializer) }
    let(:library)    { double(:library) }

    let(:purchases_json) do
      "[{\"title\":\"s321\",\"plot\":\"s321\"},{\"title\":\"numbers\",\"plot\":\"just numbers\"},{\"title\"...title\":\"b\",\"plot\":\"bb\"},{\"title\":\"c\",\"plot\":\"cc\"},{\"title\":\"d\",\"plot\":\"dd\"}]"
    end

    before(:each) do
      allow(Users::Library::Get).to receive(:new).and_return(library)
      allow(library).to receive(:sort_by).and_return(purchases)
      allow(Library::Serializer).to receive(:new).with(purchases).and_return(serializer)
      allow(serializer).to receive(:to_json).and_return(purchases_json)
    end

    context 'when user id provided' do
      it 'retrieves the contents' do
        get '/library?user_id=1'

        expect(last_response).to be_ok
        expect(last_response.body).to eq(purchases_json)
      end
    end

    context 'when user id is not provided' do
      it 'returns a wrong response with http error' do
        get '/library'

        expect(last_response.status).to eq(400)
      end
    end
  end

  describe '/purchase' do
    context 'when required params provided' do
      let(:builder) { double(:builder) }
      
      context 'and is a movie' do
        it 'proceeds to perform the purchase' do
          expect(Purchases::Builder::Movie).to receive(:new).and_return(builder)
          expect(builder).to receive(:perform)

          post '/purchase?user_id=3&video_quality=2&movie_id=1'
        end
      end

      context 'and is a season' do
        it 'proceeds to perform the purchase' do
          expect(Purchases::Builder::Season).to receive(:new).and_return(builder)
          expect(builder).to receive(:perform)

          post '/purchase?user_id=3&video_quality=2&season_id=1'
        end
      end
    end

    context 'when required params not provided' do
      it 'proceeds to perform the purchase' do
        post '/purchase?user_id=3&season_id=1'

        expect(last_response.status).to eq(400)
      end
    end
  end
end
