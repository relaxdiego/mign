# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'spork' do
  watch('config/application.rb')
  watch('config/environment.rb')
  watch('config/cucumber.yml')
  watch(%r{^config/environments/.*\.rb$})
  watch(%r{^config/initializers/.*\.rb$})
  watch('Gemfile')
  watch('Gemfile.lock')
  watch('spec/spec_helper.rb') { :rspec }
  watch('test/test_helper.rb') { :test_unit }
  watch(%r{features/support/}) { :cucumber }
end

guard 'migrate', :reset => true do
  watch(%r{^db/migrate/(\d+).+\.rb}) do |m|
    puts "#{m[0]} changed..."
    m[0]
  end
end
puts "Guard::Migrate is now watching .rb files under db/migrate"

guard 'sass', :input => 'app/assets/stylesheets', :noop => true
puts "Guard::Sass is now watching stylesheets in app/assets/stylesheets"

# verify that application Javascript files are lintable
# see https://github.com/psionides/jslint_on_rails
guard 'jslint-on-rails' do
  # watch for changes to application javascript files
  watch(%r{^app/assets/javascripts/.*\.js$}) do |m|
    puts "#{m[0]} changed..."
    m[0]
  end
  puts "Guard::JsLintOnRails is now watching javascript files in app/assets/javascripts"

  # watch for changes to the JSLint configuration
  watch('config/jslint.yml') do |m|
    puts "#{m[0]} changed..."
    m[0]
  end
end

guard 'cucumber', :cli => "--drb --require features/", :all_after_pass => true do
  watch(%r{^features/.+\.feature$})
  watch(%r{^features/support/.+$})                      { 'features' }
  watch(%r{^features/pages/.+\.rb$})                      { 'features' }
  watch(%r{^features/step_definitions/(.+)_steps\.rb$}) do |m|
    if m[1] == 'memberships'
      'features/categories/workspaces'
    else
      Dir[File.join("**/categories/#{m[1]}")][0] || 'features'
    end
  end
  watch('spec/factories.rb')                            { "cucumber" }
  watch(%r{^app/views/(.+)/.*\.(erb|haml)$})          { |m| Dir[File.join("features/categories/#{m[1]}")][0] || 'features' }
  watch(%r{app/(.+)\.rb})                        { "cucumber" }

  # Guard#run_all runs when you hit 'Enter' in the terminal
  callback(:run_all_begin) { coverage    }
  callback(:run_all_end)   { no_coverage }
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

  # Guard#run_all runs when you hit 'Enter' in the terminal
  callback(:run_all_begin) { coverage    }
  callback(:run_all_end)   { no_coverage }
end

def coverage
  `touch tmp/coverage.txt`
end

def no_coverage
  if File.exists?( 'tmp/coverage.txt' )
    `rm tmp/coverage.txt`
  end
end
