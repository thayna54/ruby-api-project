require 'allure-cucumber'
require 'factory_bot'
require 'faker'
require 'httparty'
require 'rspec'

require_relative 'spec_helper/spec_rest'
require_relative 'spec_helper/spec_valid'

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

Allure.configure do |c|
  c.results_directory = 'allure-results'
  c.clean_results_directory = true
  c.logging_level = Logger::INFO
  c.link_tms_pattern = 'http://www.hiptest.com/browse/{}'
  c.link_issue_pattern = 'http://www.jira.com/browse/{}'
end

AllureCucumber.configure do |c|
  c.tms_prefix = 'HIPTEST--'
  c.issue_prefix = 'JIRA++'
  c.severity_prefix = 'SEVERITY:'
end
