#!/usr/bin/env rake

require 'bundler'
Bundler::GemHelper.install_tasks

require 'rspec/core/rake_task'

desc "Run all tests"
task :spec do
  Rake::Task['spec:unit'].execute
end

namespace :spec do
  RSpec::Core::RakeTask.new(:unit) do |t|
    t.rspec_opts = '--color'
    t.pattern = 'spec/unit/**/*_spec.rb'
  end
end

task :default => :spec
task :test => :spec
