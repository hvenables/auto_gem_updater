require_relative '../outdated'
require_relative '../updater'

namespace :auto_gem_updater do
  desc 'Outdated gems minus exluded list'
  task outdated: :environment do
    puts 'Outdated Gems'
    puts '-' * 80
    AutoGemUpdater::Outdated.perform.each do |name:, newest:, installed:|
      puts "Gem: #{name} - current version: #{installed}, newest version: #{newest}"
    end
    puts '-' * 80
  end

  desc 'Auto Updates the Gems'
  task update: :environment do
    AutoGemUpdater::Updater.perform
  end
end
