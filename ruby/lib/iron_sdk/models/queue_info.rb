module IronSdk
  # 
  class QueueInfo < BaseObject
    attr_accessor :project_id, :name, :message_timeout, :message_expiration, :consistency_factor, :replicase, :type, :push, :alerts
    # attribute mapping from ruby-style variable name to JSON key
    def self.attribute_map
      {
        
        # 
        :'project_id' => :'project_id',
        
        # Name of the queue
        :'name' => :'name',
        
        # 
        :'message_timeout' => :'message_timeout',
        
        # 
        :'message_expiration' => :'message_expiration',
        
        # 
        :'consistency_factor' => :'consistency_factor',
        
        # 
        :'replicase' => :'replicase',
        
        # Types can be [multicast, unicast, pull] where multicast and unicast define a push queue. If a type isnt specified, it defaults to pull. If the push field is defined, the queue will be crated as a push queue and must contain at least one subscriber. Everything else in the push map is optional.\&quot;\n
        :'type' => :'type',
        
        # 
        :'push' => :'push',
        
        # 
        :'alerts' => :'alerts'
        
      }
    end

    # attribute type
    def self.swagger_types
      {
        :'project_id' => :'string',
        :'name' => :'string',
        :'message_timeout' => :'int',
        :'message_expiration' => :'int',
        :'consistency_factor' => :'string',
        :'replicase' => :'int',
        :'type' => :'string',
        :'push' => :'Push',
        :'alerts' => :'array[Alert]'
        
      }
    end

    def initialize(attributes = {})
      return if !attributes.is_a?(Hash) || attributes.empty?

      # convert string to symbol for hash key
      attributes = attributes.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}

      
      if attributes[:'project_id']
        @project_id = attributes[:'project_id']
      end
      
      if attributes[:'name']
        @name = attributes[:'name']
      end
      
      if attributes[:'message_timeout']
        @message_timeout = attributes[:'message_timeout']
      end
      
      if attributes[:'message_expiration']
        @message_expiration = attributes[:'message_expiration']
      end
      
      if attributes[:'consistency_factor']
        @consistency_factor = attributes[:'consistency_factor']
      end
      
      if attributes[:'replicase']
        @replicase = attributes[:'replicase']
      end
      
      if attributes[:'type']
        @type = attributes[:'type']
      end
      
      if attributes[:'push']
        @push = attributes[:'push']
      end
      
      if attributes[:'alerts']
        if (value = attributes[:'alerts']).is_a?(Array)
          @alerts = value
        end
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
