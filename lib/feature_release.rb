require "feature_release/version"
require "feature_release/feature"
require "feature_release/storage"

class FeatureRelease

  attr_reader :groups, :features
  
  def initialize(storage=nil)
  	@groups = {:all => lambda{|obj| true}}
  	@features = Hash.new do |hash, missing_key|
  	              hash[missing_key] = Feature.new(missing_key)
  	            end
    set_storage(storage) if storage
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

  def persisted?(feature)
    !(@storage.get(@features[feature.to_sym].name).nil?)
  end

  def save
    @features.each{|key, value|  @storage.save(value.name, value.to_string)}
  end

  private

    def set_storage(storage)
      @storage = storage
      @storage.get_all.each do |feature_name|
        @features[feature_name.to_sym] = Feature.new(feature_name, @storage.get(feature_name))
      end
    end

end
