# typed: false
ENV["RACK_ENV"] = "test"

require File.expand_path("../../config/environment", __FILE__)
abort("DATABASE_URL environment variable is set") if ENV["DATABASE_URL"]

require "rspec/rails"
require "clearance/rspec"

Dir[Rails.root.join("spec/support/**/*.rb")].sort.each { |file| require file }
Dir[Rails.root.join("spec/helpers/**/*.rb")].sort.each { |file| require file }

RSpec.configure do |config|
  config.infer_base_class_for_anonymous_controllers = false
  config.infer_spec_type_from_file_location!
  config.use_transactional_fixtures = false
  config.include ExternalRequestHelpers
end

ActiveRecord::Migration.maintain_test_schema!
