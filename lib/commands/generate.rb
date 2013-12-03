require_relative 'base'

module Commands
  class Generate < Base

    desc 'module <user-name> [--path /destination/module/path] [--examples]', 'generates puppet module structure'
    option :path, :default => Dir.pwd
    option :examples, :default => false
    def module(dashed_module_name)
      root = options[:path]
      user, module_name = dashed_module_name.split('-')
      destination = File.join(root, "#{user}-#{module_name}")

      module_skeleton(destination, module_name)
      dot_git(destination)
      vagrantfile(destination, module_name)
      examples(destination, module_name) if options[:examples]
    end

    private
    def module_skeleton(destination, module_name)
      directory('module_skeleton', destination)

      template_variables = { :module_name => module_name }
      serverspec_helper_path = File.join(destination, 'spec', 'serverspec_helper.rb')
      template('serverspec_helper.rb.erb', serverspec_helper_path, template_variables)
    end

    def dot_git(destination)
      directory('git', File.join(destination, '.git'))
    end

    def vagrantfile(destination, module_name)
      template_variables = { :module_name => module_name }
      template('Vagrantfile.erb', File.join(destination, 'Vagrantfile'), template_variables)
    end

    def examples(destination, module_name)
      init_pp_example(destination, module_name)
      unit_spec_example(destination, module_name)
      integration_spec_example(destination, module_name)
    end

    def init_pp_example(destination, module_name)
      template_variables = { :class_name => module_name }
      init_pp_path = File.join(destination, 'manifests', "init.pp")

      template('init.pp.erb', init_pp_path, template_variables)

      motd_erb_path = File.join(destination, 'templates', 'etc', 'motd.erb')
      copy_file('motd.erb', motd_erb_path)
    end

    def unit_spec_example(destination, module_name)
      template_variables = { :class_name => module_name }
      unit_spec_path = File.join(destination, 'spec', 'unit', 'classes', "#{module_name}_spec.rb")

      template('unit_spec.rb.erb', unit_spec_path, template_variables)
    end

    def integration_spec_example(destination, module_name)

      template_variables = { :class_name => module_name }
      integration_spec_path = File.join(destination, 'spec', 'integration', "#{module_name}_spec.rb")
      init_pp_fixture_path = File.join(destination, 'spec', 'fixtures', 'manifests', 'init.pp')

      template('integration_spec.rb.erb', integration_spec_path, template_variables)
      template('init_fixture.pp.erb', init_pp_fixture_path, template_variables)
    end
  end
end
