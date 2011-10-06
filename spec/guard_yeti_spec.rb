# encoding: UTF-8

require 'spec_helper'

describe "guard-yeti" do

  before do
    # mock of the kernel system call
    module Kernel
      def `(cmd)
        cmd
      end
    end
  end

  it "runs yeti on update" do
    yeti = Guard::Yeti.new
    yeti.run_on_change(["yui_test_file.html"])
    yeti.latest_output.must_equal "yeti yui_test_file.html --solo=1"
  end

end
