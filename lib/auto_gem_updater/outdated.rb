require 'open3'

module AutoGemUpdater
  class Outdated
    GEM_LINE_REGEX =
      /(?<gem>[\w-]+)\s{1}\(newest\s{1}(?<newest>[\d\.]+)\,\s{1}installed\s{1}(?<installed>[\d\.]+)\)/

    def initialize
      @bundle_outdated_command =
        "bundle outdated --parseable #{AutoGemUpdater.outdated_options}"
    end

    def self.perform
      new.perform
    end

    private_class_method :new

    def perform
      outdated_gems = []

      Open3
        .popen3(bundle_outdated_command) do |_stdin, stdout, _stderr, _wait_thr|
          while (line = stdout.gets)
            parsed_data = parse_line(line)
            next if parsed_data.nil? || AutoGemUpdater.ignore_gems.include?(parsed_data[:name])

            outdated_gems.push(parsed_data)
          end
        end

      outdated_gems
    end

    private

    attr_reader :bundle_outdated_command

    def parse_line(line)
      return unless (match_data = line.match(GEM_LINE_REGEX))

      {
        name: match_data[:gem],
        newest: match_data[:newest],
        installed: match_data[:installed]
      }
    end
  end
end
