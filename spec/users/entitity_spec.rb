describe Users::Entity do
  let(:opts) do
    { mail:      double(:mail) }
  end

  subject { described_class.new(opts) }

  describe '#mail' do
    it 'has a mail property' do
      expect(subject.mail).to be_truthy
    end
  end
end