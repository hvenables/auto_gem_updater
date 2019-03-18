require_relative 'system'
require_relative 'outdated'

module AutoGemUpdater
  class Updater
    include System

    def self.perform
      new(outdated_gems: AutoGemUpdater::Outdated.perform).perform
    end

    def initialize(outdated_gems:)
      @outdated_gems = outdated_gems
    end
    private_class_method :new

    def perform
      return unless outdated_gems.any?
      return unless system("git checkout -b auto_gem_updates_#{Time.now.strftime('%d_%m_%Y')}")

      outdated_gems.each do |name:, newest:, installed:|
        puts "Updating #{name} from #{installed} to #{newest}"
        system_command("bundle update #{name} --conservative")

        if AutoGemUpdater.pre_checks.all? { |check| system_command(check) }
          puts "Update checks passed commiting update to #{name}"

          system_command('git add Gemfile.lock')
          system_command("git commit -m 'Updated: #{name} from #{installed} to #{newest}'")
        else
          puts "Failed to update the gem #{name}"
          system_command('git checkout .')
        end
      end
    end

    private

    attr_reader :outdated_gems
  end
end
