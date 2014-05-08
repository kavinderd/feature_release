require 'spec_helper'

describe FeatureRelease::Storage do

  before(:each) do
  	@redis = MockRedis.new
  end

  it "should initialize with a store" do
  	expect{FeatureRelease::Storage.new()}.to raise_error
  	expect{FeatureRelease::Storage.new(store: @redis)}.to_not raise_error
  end

end