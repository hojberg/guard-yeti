require 'guard'
require 'guard/guard'

module Guard
  class Yeti < Guard

    autoload :Notifier, 'guard/yeti/notifier'

    def initialize(watches = [], options = {})
      super
      UI.info "Guard::Yeti has started!"
      @latest_output = "sucks"
    end

    def start
      UI.info "Guard::Yeti is running!"
    end

    def run_on_change(paths)
      return false if paths.empty? || !File.exist?(paths[0])

      UI.info("yeti #{paths[0]} --solo=1", :reset => true)

      output = %x[yeti #{paths[0]} --solo=1]
      result = $?.success?

      Notifier.notify(result, result ? "Passed" : "Failed")

      [result, output]
    end

  end
end
