require 'spec_helper'

describe FeatureRelease::Feature do


  it "initializes with a name" do
  	expect{f = FeatureRelease::Feature.new(:test_feature)}.to_not raise_error
  end

  it "sets a default array to groups" do
  	f = FeatureRelease::Feature.new(:test_feature)
  	f.groups.should eq([])
  end

  it "allows groups to be added to @groups" do
  	f = FeatureRelease::Feature.new(:test_feature)
  	f.add_group(:testers)
  end

  it "allows groups to be removed from @groups" do
  	f = FeatureRelease::Feature.new(:test_feature)
  	f.add_group(:testers)
  	f.remove_group(:testers)
  	f.groups.should_not include(:testers)
  end
	
end