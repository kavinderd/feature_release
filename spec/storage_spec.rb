require 'spec_helper'

describe FeatureRelease::Storage do

  before(:each) do
  	@redis = MockRedis.new
  end

  it "should initialize with a store" do
  	expect{FeatureRelease::Storage.new()}.to raise_error
  	expect{FeatureRelease::Storage.new(store: @redis)}.to_not raise_error
  end

  context 'saving features' do

  	before(:each) do
  	  @storage = FeatureRelease::Storage.new(store: @redis)
  	  @feature = double 'Feature', name: "test_feature", serialized: "test_users, new_users, admin_users"
  	end

  	it "should save a feature to the store" do
  	  @storage.save(@feature)
  	  @storage.get(@feature).should eq(@feature.serialized)
  	end

  	it "should add a feature to the collection of features" do
  	  @storage = FeatureRelease::Storage.new(store: @redis)
  	  @storage.save(@feature)
  	  @storage.get_all.should eq(["test_feature"])
  	end

  end

end