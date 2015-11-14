# A sample Guardfile
# More info at https://github.com/guard/guard#readme

## Uncomment and set this to only include directories you want to watch
# directories %w(app lib config test spec features) \
#  .select{|d| Dir.exists?(d) ? d : UI.warning("Directory #{d} does not exist")}

## Note: if you are using the `directories` clause above and you are not
## watching the project directory ('.'), then you will want to move
## the Guardfile to a watched dir and symlink it back, e.g.
#
#  $ mkdir config
#  $ mv Guardfile config/
#  $ ln -s config/Guardfile .
#
# and, you'll have to watch "config/Guardfile" instead of "Guardfile"

# guard 'ctags-bundler',
#       src_path: ['app', 'lib', 'spec/support'],
#       project_file: '.tags' do
#   watch(/^(app|lib|spec\/support)\/.*\.rb$/)
#   watch('Gemfile.lock')
# end

guard :rspec, cmd: 'spring rspec -c -f doc' do
  require 'guard/rspec/dsl'
  # dsl = Guard::RSpec::Dsl.new(self)

  # Feel free to open issues for suggestions and improvements

  # RSpec files
  # rspec = dsl.rspec
  # watch(rspec.spec_helper) { rspec.spec_dir }
  # watch(rspec.spec_support) { rspec.spec_dir }
  # watch(rspec.spec_files)

  # Ruby files
  # ruby = dsl.ruby
  # dsl.watch_spec_files_for(ruby.lib_files)

  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch(%r{^app/(.+)\.rb$})     { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^extras/(.+)\.rb$})     { |m| "extras/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { 'spec' }
  # Turnip features and steps
  # watch(%r{^spec/acceptance/(.+)\.feature$})
  # watch(%r{^spec/acceptance/steps/(.+)_steps\.rb$}) do |m|
  #   Dir[File.join("**/#{m[1]}.feature")][0] || "spec/acceptance"
  # end
end

guard :bundler do
  require 'guard/bundler'
  require 'guard/bundler/verify'
  helper = Guard::Bundler::Verify.new

  files = ['Gemfile']
  files += Dir['*.gemspec'] if files.any? { |f| helper.uses_gemspec?(f) }

  # Assume files are symlinked from somewhere
  files.each { |file| watch(helper.real_path(file)) }
end
