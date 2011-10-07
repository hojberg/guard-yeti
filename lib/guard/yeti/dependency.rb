module Guard
  class Yeti
    class Dependency
      def self.verify_or_raise(command)
        output = system("which #{command} >/dev/null")
        unless $?.to_i == 0
          raise "Error: #{command} is not installed, which is a requirement of guard-yeti" 
        end
      end
    end
  end
end
