require 'spec_helper'

describe 'foo', :type => 'class' do
  
  context "when there are no BAR options set" do
    it { should_not contain_class("foo::bar") }
  end

  context "when BAR configuration options are set" do
    hash = { 'some_key' => "Some Value" }
    let :hiera_data do
      {
        'foo::bar::options' => hash
      }
    end
    it { should contain_class('foo::bar') }
  end
  
end