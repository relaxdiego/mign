# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'spork' do
  watch('config/application.rb')
  watch('config/environment.rb')
  watch(%r{^config/environments/.*\.rb$})
  watch(%r{^config/initializers/.*\.rb$})
  watch('Gemfile')
  watch('Gemfile.lock')
  watch('spec/spec_helper.rb') { :rspec }
  watch('test/test_helper.rb') { :test_unit }
  watch(%r{features/support/}) { :cucumber }
end

guard 'cucumber', :cli => "--drb --require features/" do
  watch(%r{^features/.+\.feature$})
  watch(%r{^features/support/.+$})                      { 'features' }
  watch(%r{^features/step_definitions/(.+)_steps\.rb$}) { |m| Dir[File.join("**/#{m[1]}.feature")][0] || 'features' }

  # Guard#start runs once right after startup
  callback(:start_begin) { coverage }
  callback(:start_end) { no_coverage }

  # Guard#run_all runs
  callback(:run_all_begin) { coverage }
  callback(:run_all_end) { no_coverage }
end

guard 'rspec', :version => 2, :all_after_pass => true do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }

  # Rails example
  watch(%r{^app/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^app/(.*)(\.erb|\.haml)$})                 { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
  watch(%r{^app/controllers/(.+)_(controller)\.rb$})  { |m| ["spec/routing/#{m[1]}_routing_spec.rb", "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb", "spec/acceptance/#{m[1]}_spec.rb"] }
  watch(%r{^spec/support/(.+)\.rb$})                  { "spec" }
  watch('config/routes.rb')                           { "spec/routing" }
  watch('app/controllers/application_controller.rb')  { "spec/controllers" }

  # Capybara request specs
  watch(%r{^app/views/(.+)/.*\.(erb|haml)$})          { |m| "spec/requests/#{m[1]}_spec.rb" }

  # FactoryGirl factory definitions
  watch('spec/factories.rb')  { "spec" }

  # Guard#start runs once right after startup
  callback(:start_begin) { coverage }
  callback(:start_end) { no_coverage }

  # Guard#run_all runs
  callback(:run_all_begin) { coverage }
  callback(:run_all_end) { no_coverage }
end

def coverage
  `touch tmp/coverage.txt`
end

def no_coverage
  `rm tmp/coverage.txt`
end
