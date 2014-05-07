require "feature_release/version"
require "feature_release/feature"

class FeatureRelease

  attr_reader :groups, :features
  
  def initialize
  	@groups = {:all => lambda{|obj| true}}
  	@features = Hash.new do |hash, missing_key|
  	              hash[missing_key] = Feature.new(missing_key)
  	            end
  end

  def define_group(name, &block)
  	@groups[name] = block
  end

  def activate_feature(feature, group)
  	@features[feature.to_sym].add_group(group)
  end

  def deactivate_feature(feature, group)
  	@features[feature.to_sym].remove_group(group)
  end

  def active?(feature, user)
  	return false if @features[feature.to_sym].groups.empty?
  	@features[feature.to_sym].groups.all? {|group| groups[group].call(user)}
  end

end
