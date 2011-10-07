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

    @yeti = Guard::Yeti.new
  end

  it "should run yeti on update" do
    @yeti.run_on_change(["spec/fixtures/yui_test_file.html"]).
      must_equal [true, "yeti spec/fixtures/yui_test_file.html --solo=1"]
  end

  it "should not run yeti if file doesn't exist" do
    @yeti.run_on_change(["spec/fixtures/bogus_yui_test_file.html"]).
      must_equal false
  end

end
