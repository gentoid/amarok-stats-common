require 'thor'

module AmarokStatsCommon
  module CLI
    class Plugin < Thor

      desc 'disable PLUGIN-NAME', 'disable amarok-stats plugin by its name'
      def disable(name)
        puts 'WIP' # todo: implement
      end

    end
  end
end
