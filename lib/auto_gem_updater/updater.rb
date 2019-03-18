require 'open3'
require_relative 'system'

module AutoGemUpdater
  class Updater
    include System

    def self.perform(outdated_gems)
      new(outdated_gems).perform
    end

    def initialize(outdated_gems)
      @outdated_gems = outdated_gems
    end
    private_class_method :new

    def perform
      return unless outdated_gems.any?
      return unless system("git checkout -b auto_gem_updates_#{Time.now.strftime('%d_%m_%Y')}")

      outdated_gems.each do |name:, newest:, installed:|
        puts "Updating #{name} from #{installed} to #{newest}"
        system_command("bundle update #{name} --conservative")

        if system_command("rspec")
          puts "Update checks passed commiting update to #{name}"

          system_command("git add .")
          system_command("git commit -m 'Update the gem #{name} from #{installed} to #{newest}'")
        end
      end
    end

    private

    attr_reader :outdated_gems
  end
end
