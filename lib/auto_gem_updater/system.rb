module AutoGemUpdater
  module System
    def system_command(command)
      system(command, %i[out err] => File::NULL)
    end
  end
end
