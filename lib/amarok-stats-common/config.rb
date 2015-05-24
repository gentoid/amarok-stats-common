module AmarokStatsCommon
  class Config

    class << self
      def filename
        File.join(Dir.home, '.config', 'amarok_stats', 'config.yml')
      end

      def load
        if File.exists? filename
          File.read filename
        else
          {}
        end
      end
    end

  end
end
