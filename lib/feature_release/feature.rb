class FeatureRelease

  class Feature

  	attr_accessor :groups
    attr_reader :name

    def initialize(name, groups_string=nil)
      @name = name
      @groups = []
      parse_groups(groups_string)
    end  	

    def add_group(group)
      @groups << group.to_sym
    end

    def remove_group(group)
      @groups.delete(group.to_sym)
    end

    def to_string
      @groups.join(",")
    end

    private
      def parse_groups(string)
        return unless string
        @groups = string.split(",").map(&:to_sym)
      end

  end

end