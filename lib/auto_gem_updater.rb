require 'auto_gem_updater/version'
require 'auto_gem_updater/railtie'

module AutoGemUpdater
  def self.configure
    yield self
  end

  def self.pre_checks=(pre_checks)
    @pre_checks = pre_checks
  end

  def self.pre_checks
    @pre_checks || []
  end

  def self.outdated_options=(outdated_options)
    @outdated_options = outdated_options.map { |option| " --#{option}" }.join
  end

  def self.outdated_options
    @outdated_options || '--strict'
  end

  def self.ignore_gems=(ignore_gems)
    @ignore_gems = ignore_gems
  end

  def self.ignore_gems
    @ignore_gems || []
  end
end
