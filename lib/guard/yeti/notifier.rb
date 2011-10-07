require 'guard/notifier'

module Guard
  class Yeti
    class Notifier
      def self.notify(result, message)
        ::Guard::Notifier.notify(message, :title => 'Yeti test results', :image => (result ? :success : :failed))
      end
    end
  end
end
