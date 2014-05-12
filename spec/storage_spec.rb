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
  	  @feature = double 'Feature', name: :test_feature, to_string: "test_users, new_users, admin_users"
  	end

  	it "should save a feature to the store" do
  	  @storage.save(@feature.name, @feature.to_string)
  	  @storage.get(@feature.name).should eq(@feature.to_string)
  	end

  	it "should add a feature to the collection of features" do
  	  @storage = FeatureRelease::Storage.new(store: @redis)
  	  @storage.save(@feature.name, @feature.to_string)
  	  @storage.get_all.should eq([:test_feature])
  	end

  end

end