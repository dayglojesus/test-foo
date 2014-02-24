require 'spec_helper'

describe 'foo::bar', :type => 'class' do

  context "when it is passed no params" do
    specify { expect { should compile }.to raise_error(Puppet::Error) }
  end
  
  context "when it is passed a BAD param" do
    let :hiera_data do
      { 'foo::bar::options' => "Icanhazstring" }
    end
    specify { expect { should compile }.to raise_error(Puppet::Error) }
  end
  
  context "when passed a Hash parameter" do
    let :hiera_data do
      {
        'foo::bar::options' => {}
      }
    end
    it { should compile }
  end
  
end