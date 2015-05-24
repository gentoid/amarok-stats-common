require 'amarok-stats-common/config'

module AmarokStatsCommon

  describe Config do
    describe '.filename' do
      it 'returns string' do
        expect(described_class.filename).to be_a(String)
      end
    end

    describe '.load' do
      context "file doesn't exist" do
        before :each do
          allow(File).to receive(:exists?).with(described_class.filename).and_return(false)
        end

        it 'returns empty Hash' do
          expect(described_class.load).to be_eql({})
        end
      end

      # todo: need clear way to load valid/not-valid data from real files in `spec/`
      context 'file exists' do
        before :each do
          allow(described_class).to receive(:filename).and_return(filename)
        end

        context 'and contains valid YAML data' do
          let(:filename) { 'spec/fake_data/config.yml' }

          it "reads the file returned by '.filename'" do
            expect(described_class.load).to be_eql({})
          end
        end
      end
    end
  end

end
