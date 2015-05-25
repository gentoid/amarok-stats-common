require 'yaml'
require 'facets/hash/deep_rekey'

module AmarokStatsCommon
  class Config

    class NotValidConfig < StandardError; end

    class << self
      def filename
        File.join(Dir.home, '.config', 'amarok_stats', 'config.yml')
      end

      def load
        if File.exists? filename
          begin
            YAML.load_file(filename).deep_rekey
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
