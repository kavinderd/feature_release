require 'spec_helper'

describe FeatureRelease::Feature do


  it "initializes with a name" do
  	expect{f = FeatureRelease::Feature.new(:test_feature)}.to_not raise_error
  end
	
end