require 'amarok-stats-common/config'

module AmarokStatsCommon

  describe Config do
    describe '.filename' do
      it 'returns string' do
        expect(described_class.filename).to be_a(String)
      end
    end

    describe '.load' do
      let(:described_method) { described_class.load }

      context "when file doesn't exist" do
        before :each do
          allow(File).to receive(:exists?).with(described_class.filename).and_return(false)
        end

        it 'returns empty Hash' do
          expect(described_method).to be_eql({})
        end
      end

      context 'when file exists' do
        let(:filename) { 'spec/fake_data/config.yml' }

        before :each do
          allow(described_class).to receive(:filename).and_return(filename)
        end

        it "loads the file returned by '.filename'" do
          expect(YAML).to receive(:load_file).with(filename)
          described_method
        end

        context 'and contains valid YAML data' do
          it 'returns Hash' do
            expect(described_method).to be_a(Hash)
          end

          it 'returns non-empty Hash' do
            expect(described_method).to_not be(:empty?)
          end
        end
      end
    end
  end

end
