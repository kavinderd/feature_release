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

  	it "should save a feature to the store" do
  	  @storage = FeatureRelease::Storage.new(store: @redis)
  	  @storage.save(double 'Feature', name: "test_feature", serialized: "test_users, new_users, admin_users")
  	  @redis.get("features:test_feature").should eq("test_users, new_users, admin_users")
  	end


  end

end