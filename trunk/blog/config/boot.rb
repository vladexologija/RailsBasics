require 'rubygems'

# Set up gems listed in the Gemfile.
# Ruby idiom for getting the absolute path to a file when you know the path relative to the current file
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])
