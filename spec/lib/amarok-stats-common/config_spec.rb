require 'amarok-stats-common/config'

module AmarokStatsCommon

  describe Config do
    describe '.config_file' do
      it 'returns string' do
        expect(described_class.config_file).to be_a(String)
      end
    end

    describe '.load' do
      let(:described_method) { described_class.load }

      context "when file doesn't exist" do
        before :each do
          allow(File).to receive(:exist?).with(described_class.config_file).and_return(false)
        end

        it 'returns empty Hash' do
          expect(described_method).to be_eql({})
        end
      end

      context 'when file exists' do
        let(:config_file) { 'spec/fake_data/config.yml' }

        before :each do
          allow(described_class).to receive(:config_file).and_return(config_file)
        end

        it "loads the file returned by '.config_file'" do
          expect(YAML).to receive(:load_file).with(config_file).and_return({})
          described_method
        end

        context 'and contains valid YAML data' do
          it 'returns Hash' do
            expect(described_method).to be_a(Hash)
          end

          it 'returns non-empty Hash' do
            expect(described_method).to_not be(:empty?)
          end

          def deep_keys_symbolized?(hash)
            result = true

            hash.each do |key, value|
              break result = false unless key.is_a?(Symbol)
              result = deep_keys_symbolized?(value) if value.is_a?(Hash)
            end

            result
          end

          it 'returns Hash with symbolized keys' do
            expect(deep_keys_symbolized?(described_method)).to be(true)
          end
        end

        context 'and contains non-valid YAML data' do
          let(:config_file) { 'spec/fake_data/invalid-config.yml' }

          it 'raises error' do
            expect { described_method }.to raise_error(described_class::NotValidConfig)
          end
        end
      end
    end
  end

end
