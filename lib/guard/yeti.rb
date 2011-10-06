require 'guard'
require 'guard/guard'

module Guard
  class Yeti < Guard

    autoload :Notifier, 'guard/yeti/notifier'

    def initialize(watches = [], options = {})
      super
      UI.info "init"
    end

    def start
      UI.info "Guard::Yeti is running!"
    end

    def run_on_change(paths)
      return false if paths.empty?

      UI.info("yeti #{paths[0]} --solo=1", :reset => true)

      @latest_output = %x[yeti #{paths[0]} --solo=1]
      @latest_result=$?.success?

      Notifier.notify(@latest_result, @latest_result ? "Passed" : "Failed")
    end

  end
end
