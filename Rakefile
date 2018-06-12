#!/usr/bin/env rake

require 'rspec/core/rake_task'
require 'foodcritic'
require 'cookstyle'
require 'kitchen'
require 'rubocop/rake_task'
require 'chef-dk/cli'

def execute_chefdk(glob_path, command)
  Dir.glob(glob_path).each do |file|
    args = command.split(' ') << file
    cli = ChefDK::CLI.new(args)
    subcommand_name, *subcommand_params = cli.argv
    subcommand = cli.instantiate_subcommand(subcommand_name)
    subcommand.run_with_default_options(subcommand_params)
  end
end

# Style tests. Rubocop and Foodcritic
namespace :style do
  desc 'Run Ruby style checks'
  RuboCop::RakeTask.new(:ruby)

  desc 'Run Chef style checks'
  FoodCritic::Rake::LintTask.new(:chef) do |t|
    t.options = {
      fail_tags: ['any'],
      progress: true,
    }
  end
end

desc 'Run all style checks'
task style: ['style:chef', 'style:ruby']

# Rspec and ChefSpec
desc 'Run ChefSpec examples'
RSpec::Core::RakeTask.new(:spec)

# Integration tests. Kitchen.ci
namespace :integration do
  desc 'Run Test Kitchen with Vagrant'
  task :vagrant do
    Kitchen.logger = Kitchen.default_file_logger
    Kitchen::Config.new.instances.each(&:destroy)

    # replset
    replset = %w(
      replset1-el7
      replset2-el7
      replset-hidden-el7
      replset3-el7
    )
    replset.each { |n| Kitchen::Config.new.instances.get(n).converge }
    replset.each { |n| Kitchen::Config.new.instances.get(n).verify }
    replset.each { |n| Kitchen::Config.new.instances.get(n).destroy }

    # sharding
    sharding = %w(
      cfg1-el7
      cfg2-el7
      cfg3-el7
      shard1-el7
      shard2-el7
      shard-set1-el7
      shard-set2-el7
      shard-set3-el7
      mongos-el7
    )
    sharding.each { |n| Kitchen::Config.new.instances.get(n).converge }
    sharding.each { |n| Kitchen::Config.new.instances.get(n).verify }
    sharding.each { |n| Kitchen::Config.new.instances.get(n).destroy }
  end
end

namespace :policyfile do
  desc 'Run "chef update" for all files `policies/*.rb`'
  task :update do
    execute_chefdk('policies/*.rb', 'update')
  end
end

# Default
task default: ['style', 'spec', 'integration:vagrant']
