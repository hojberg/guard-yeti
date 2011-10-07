require 'guard'
require 'guard/guard'

module Guard
  class Yeti < Guard

    autoload :Notifier, 'guard/yeti/notifier'
    autoload :Dependency, 'guard/yeti/dependency'

    def initialize(watches = [], options = {})
      super

      ['yeti', 'node'].each do |command|
        Dependency.verify_or_raise(command)
      end

      UI.info "Guard::Yeti has started!"
      @latest_output = "sucks"
    end

    def start
      UI.info "Guard::Yeti is running!"
    end

    def run_on_change(paths)
      return false if paths.empty? || !File.exist?(paths[0])

      UI.debug("yeti #{paths[0]} --solo=1", :reset => true)

      output = %x[yeti #{paths[0]} --solo=1]
      result = $?.success?

      Notifier.notify(result, result ? "Passed" : "Failed")

      [result, output]
    end

  end
end
