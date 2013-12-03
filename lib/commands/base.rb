require 'thor'

module Commands
  class Base < Thor
    include Thor::Actions

    def self.banner(task, namespace = false, subcommand = true)
      task.formatted_usage(self, false, subcommand).split(':').join(' ')
    end

    def self.source_root
      File.join(File.dirname(__FILE__), '..', 'templates')
    end
  end
end
