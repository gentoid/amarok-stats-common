require 'thor'
require 'amarok-stats-common/cli/plugin'

module AmarokStatsCommon
  module CLI
    class Main < Thor

      desc 'plugin SUBCOMMAND ...ARGS', 'Manage installed plugins'
      subcommand 'plugin', CLI::Plugin

    end
  end
end
