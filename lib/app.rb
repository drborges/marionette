require 'commands/generate'

class App < Thor
  desc 'generate <module>', 'generates puppet code'
  subcommand 'generate', Commands::Generate
end
