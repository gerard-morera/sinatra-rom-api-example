describe Users::Library::Get do

  let(:params) do 
    {"user_id" => double('user_id') }
  end

  subject { described_class.new(params) }

  describe '#each' do
    it 'iterates over the user purchases' do
      expect(UsersGetPurchaseBytTimeContrainRepo).to receive(:each)

      subject.each
    end
  end
end