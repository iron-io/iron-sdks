module IronSdk
  # 
  class QueueSubscriber < BaseObject
    attr_accessor :name, :url, :header
    # attribute mapping from ruby-style variable name to JSON key
    def self.attribute_map
      {
        
        # 
        :'name' => :'name',
        
        # 
        :'url' => :'url',
        
        # 
        :'header' => :'header'
        
      }
    end

    # attribute type
    def self.swagger_types
      {
        :'name' => :'string',
        :'url' => :'string',
        :'header' => :'object'
        
      }
    end

    def initialize(attributes = {})
      return if !attributes.is_a?(Hash) || attributes.empty?

      # convert string to symbol for hash key
      attributes = attributes.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}

      
      if attributes[:'name']
        @name = attributes[:'name']
      end
      
      if attributes[:'url']
        @url = attributes[:'url']
      end
      
      if attributes[:'header']
        @header = attributes[:'header']
      end
      
    end

    # http://stackoverflow.com/questions/5030553/ruby-convert-object-to-hash
    def to_h
      hash = {}
      instance_variables.each {|var| hash[var.to_s.delete("@")] = instance_variable_get(var) }
      hash
    end
  end
end
