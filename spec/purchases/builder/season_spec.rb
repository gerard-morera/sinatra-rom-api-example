describe Purchases::Builder::Season do
  let(:params) do 
    {
      "user_id"       => double('user_id'),
      "season_id"     => double('season_id', to_i: 1),
      "video_quality" => double('video_quality')
    }
  end


  subject { described_class.new(params) }

  describe '#perform' do
    let(:user)  { double(:user) }
    let(:users) { double(:users, one: user) }

    let(:purchase_changeset)  { double(:purchase_changeset) }
    let(:changeset) {double(:changeset, map: purchase_changeset)}

    before do
      allow(UsersGetRepo).to receive(:by_id).and_return(users)
      allow(PurchasesCreateRepo).to receive(:changeset).and_return(changeset)
    end

    it 'builds the movie purchase' do
      expect(PurchasesCreateRepo).to receive(:create_with_user).with(user, purchase_changeset)

      subject.perform
    end
  end
end