require_relative '../outdated'
require_relative '../updater'

namespace :auto_gem_updater do
  desc 'Outdated gems minus exluded list'
  task :outdated do
    AutoGemUpdater::Outdated.perform
  end

  desc 'Auto Updates the Gems'
  task update: :environment do
    outdated_gems = AutoGemUpdater::Outdated.perform

    AutoGemUpdater::Updater.perform(outdated_gems)
  end
end
