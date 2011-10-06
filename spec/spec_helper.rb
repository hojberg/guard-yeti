# encoding: UTF-8

require "rubygems"
require "bundler"
Bundler.setup

$:.unshift File.expand_path("../../lib", __FILE__)

require "guard/yeti"

require 'minitest/spec'
require 'minitest/autorun'
