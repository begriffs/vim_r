require 'spec_helper'

describe "VimR::Windows" do
  it "knows how many windows there are" do
    vim_ruby_eval('VimR::Windows.count').to_i.should == 1
  end
end
