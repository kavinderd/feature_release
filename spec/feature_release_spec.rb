require 'spec_helper'

describe FeatureRelease do

  it "initializes with a default group proc" do
    fr = FeatureRelease.new
    fr.groups[:all].should be_kind_of(Proc)
  end	

end