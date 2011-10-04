require 'guard'
require 'guard/guard'

module Guard
  class Yeti < Guard

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

      output = %x[yeti #{paths[0]} --solo=1]
      result=$?.success?

      ::Guard::YetiNotifier.notify(result, result ? "Passed" : "Failed")
    end
  end
end
