require "feature_release/version"

class FeatureRelease

  attr_reader :groups, :features
  
  def initialize
  	@groups = {:all => lambda{|obj| true}}
  	@features = {}
  end

  def define_group(name, &block)
  	@groups[name] = block
  end

  def activate_feature(feature, group)
  	fsym = feature.to_sym
  	if @features[fsym]
  	  @features << group
  	else
  	  @features[fsym] = [group]
  	end
  end

  def active?(feature, user)
  	@features[feature.to_sym].all? {|group| groups[group].call(user)}
  end

end
