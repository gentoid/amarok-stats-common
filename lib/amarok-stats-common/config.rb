require 'yaml'

module AmarokStatsCommon
  class Config

    class << self
      def filename
        File.join(Dir.home, '.config', 'amarok_stats', 'config.yml')
      end

      def load
        if File.exists? filename
          YAML.load_file filename
        else
          {}
        end
      end
    end

  end
end
