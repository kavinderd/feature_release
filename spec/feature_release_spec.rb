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

  context 'activate & deactivating features' do
    let(:tester) {double("user", :new? => true)}
    let(:non_tester) {double("user", :new? => false)}

    before(:each) do
      @fr = FeatureRelease.new
      @fr.define_group(:testers) do |user|
        user.new?
      end
      @fr.activate_feature(:test_feature, :testers)
    end

    it "activates a feature for a defined group" do
      @fr.active?(:test_feature, tester).should be_true
      @fr.active?(:test_feature, non_tester).should be_false
    end

    it "deactivates a feature for a defined group" do
      @fr.deactivate_feature(:test_feature, :testers)
      @fr.active?(:test_feature, tester).should be_false
    end

  end

end