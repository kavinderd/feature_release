require 'spec_helper'

describe FeatureRelease do

  context '#new' do

  	before(:each) do
  	  @fr = FeatureRelease.new
  	end

  	it "initializes with a default group proc" do
  	  @fr.groups[:all].should be_kind_of(Proc)
  	end

  	it "initializes with a features variable" do
  	  @fr.features.should_not be_nil
  	end

  end

  context 'groups' do

    before(:each) do
      @fr = FeatureRelease.new
    end

    it "defines a group with a block" do
      @fr.define_group(:testers) do |user|
        user.new?
      end
      @fr.groups.should include(:testers)
    end

  end

end