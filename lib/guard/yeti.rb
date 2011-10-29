require 'guard'
require 'guard/guard'
require 'spoon'

module Guard
  class Yeti < Guard

    autoload :Notifier,   'guard/yeti/notifier'
    autoload :Dependency, 'guard/yeti/dependency'

    def initialize(watches = [], options = {})
      super

      ['yeti', 'node'].each do |command|
        Dependency.verify_or_raise(command)
      end

      UI.info "Guard::Yeti has started!"
    end

    def start
      UI.info "Guard::Yeti is running!"
      spawn_server 
    end

    def spawn_server
      @pid = Spoon.spawnp("yeti --server")
    end
    
    def stop
      UI.info 'Guard::Yeti is stopping..' 
      kill_server
      true
    end

    def kill_server
      if server_running? 
        Process.kill("TERM", @pid)
        Process.waitpid(@pid) rescue Errno::ESRCH
      end
      @pid = nil
    end
    
    def server_running?
      @pid ? Process.kill(0, @pid) : false
    rescue Errno::ESRCH => e
      false
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
