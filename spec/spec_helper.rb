ENV['RACK_ENV'] = 'test'

$: << File.dirname(__FILE__) + '/..'

require 'config/boot'

require 'capybara/rspec'
require 'capybara/dsl'
require 'rack/test'

Capybara.app = Puntama.dispatcher

RSpec.configure do |config|
  config.include Capybara::DSL
  syntax = :expect
  config.expect_with(:rspec) { |c| c.syntax = syntax }
  config.mock_with(:rspec) { |c| c.syntax = syntax }

  DatabaseCleaner.clean_with(:transaction)

  config.before :each do
    DatabaseCleaner.start
  end

  config.after :each do
    DatabaseCleaner.clean
  end
end
