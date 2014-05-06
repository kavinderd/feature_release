require "feature_release/version"

class FeatureRelease

  attr_reader :groups, :features
  
  def initialize
  	@groups = {:all => lambda{|obj| true}}
  	@features = []
  end

  def define_group(name, &block)
  	@groups[name] = block
  end

end
