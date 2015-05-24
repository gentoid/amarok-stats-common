require 'yaml'
require 'facets/hash/deep_rekey'

module AmarokStatsCommon
  class Config

    class << self
      def filename
        File.join(Dir.home, '.config', 'amarok_stats', 'config.yml')
      end

      def load
        if File.exists? filename and (hash = YAML.load_file(filename))
          hash.deep_rekey
        else
          {}
        end
      end
    end

  end
end
