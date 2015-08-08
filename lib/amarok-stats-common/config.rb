require 'yaml'
require 'facets/hash/deep_rekey'
require 'fileutils'

module AmarokStatsCommon

  class Config
    class NotValidConfig < StandardError; end

    class << self

      def config_dir
        File.join Dir.home, '.config', 'amarok_stats'
      end

      def config_file
        File.join config_dir, 'config.yml'
      end

      def create
        return if File.exist? config_file

        FileUtils.mkdir_p config_dir

        mock_config = { database: nil, username: nil, password: nil }
        data = { amarok: mock_config, amarok_stats: mock_config }.deep_rekey { |k| k.to_s }

        File.open(config_file, 'w') { |file| file.write YAML.dump data }
      end

      def load
        if File.exist? config_file
          begin
            YAML.load_file(config_file).deep_rekey
          rescue Psych::SyntaxError
            raise NotValidConfig
          end
        else
          {}
        end
      end

    end
  end

end
