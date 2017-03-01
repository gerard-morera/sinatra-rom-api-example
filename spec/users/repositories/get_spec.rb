describe Users::Repositories::Get do
  let(:config) { double(:config, relation: []) }
  
  let(:user) { double(:user) }
  let(:users) { double(:users, by_id: user) }

  subject { described_class.new(config) }

  describe '#by_id' do
    it 'retrieves the user of the id provided' do
      expect(subject).to receive(:users).and_return(users)
      expect(subject.by_id(1)).to eq user
    end
  end
end
