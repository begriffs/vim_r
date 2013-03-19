require 'rspec'
require 'vim_r'
require 'vimrunner'

RSpec.configure do |config|
  config.before(:suite) do
    $vim = Vimrunner.start
    $vim.command 'ruby require "rubygems"; require "vim_r"'
  end

  config.after(:suite) do
    $vim.kill
  end
end

def vim_ruby_eval str
  $vim.command "ruby puts #{str}"
end
