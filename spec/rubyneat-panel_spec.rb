require_relative 'spec_helper'

include RubyNEAT::Panel

describe Assets do
  it "checks the existence of assets" do
    expect(File.exists?(Assets::BANNER)).to be_truthy
    expect(File.exists?(Assets::ICON)).to be_truthy
  end
end
