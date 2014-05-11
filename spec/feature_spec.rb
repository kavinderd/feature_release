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

  it "can be to_s into a string" do
    f = FeatureRelease::Feature.new(:test_feature)
    f.add_group(:testers)
    f.add_group(:admins)
    f.to_s.should eq("testers,admins")
  end

  it "can be built from a string" do
    f = FeatureRelease::Feature.new(:test_feature)
    f.add_grouo(:testers)
    f.add_group(:admins)
    string = f.to_s
    from_s = FeatureRelease::Feature.new(:test_feature, string)
    from_s.groups.should eq([:testers, :admins])
  end
	
end