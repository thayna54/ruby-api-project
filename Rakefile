require 'cucumber/rake/task'
require 'yaml'

desc "Performs the given API search testing, under a brand environment with tags. Defined profiles in cucumber.yml: \n * #{YAML.load_file('cucumber.yml').keys.join("\n * ")}"
task :api_test, :brand_environment, :tags do |_, args|
  brand_environment = args[:brand_environment]
  tags = args[:tags]

  check_params(brand_environment, tags)

  Cucumber::Rake::Task.new(:execute) do |task|
    if tags 
      task.cucumber_opts = [
        '--profile report_allure',
        "--profile #{brand_environment}",
        "--tags #{tags}"
      ]
    else
      task.cucumber_opts = [
        '--profile report_allure',
        "--profile #{brand_environment}"
      ]
    end
  end

  Rake::Task[:execute].invoke
end

def check_params(environment, tags)
  raise 'Ambiente não suportados.' unless %w(prod uat des).include? environment

  puts 'Nenhuma tag informada, todos os testes serão executados.' unless tags
end
