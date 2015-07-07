require "uri"

module IronSdk
  class IronMQApi
    attr_accessor :token, :host
    basePath = "https://mq-aws-us-east-1-1.iron.io/3/projects"

    def initialize(token, host=nil)
      @token = token
      if host.nil?
        @host = 'mq-aws-us-east-1-1.iron.io'
      else
        @host = host
      end
    end

    # 
    # Get a list of all queues in a project in alphabetical order
    # @param project_id The project that the queues belong to
    # @param [Hash] opts the optional parameters
    # @option opts [int] :per_page Number of elements returned per request
    # @option opts [string] :previous If previous is empty, the list will return from the beginning. Other wise, it will start on the next queue after previous\n
    # @option opts [string] :prefix List queues starting with a certain prefix
    # @return [QueueList]
    def get_queues(project_id, opts = {})
      
      # verify the required parameter 'project_id' is set
      raise "Missing the required parameter 'project_id' when calling get_queues" if project_id.nil?
      

      # resource path
      path = "/{project_id}/queues".sub('{format}','json').sub('{' + 'project_id' + '}', project_id.to_s)

      # query parameters
      query_params = {}
      query_params[:'per_page'] = opts[:'per_page'] if opts[:'per_page']
      query_params[:'previous'] = opts[:'previous'] if opts[:'previous']
      query_params[:'prefix'] = opts[:'prefix'] if opts[:'prefix']

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      _header_accept = []
      _header_accept_result = Swagger::Request.select_header_accept(_header_accept) and header_params['Accept'] = _header_accept_result

      # HTTP header 'Content-Type'
      _header_content_type = []
      header_params['Content-Type'] = Swagger::Request.select_header_content_type(_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      
      auth_names = ['oauth_token']
      response = Swagger::Request.new(:GET, path, @host, {:params => query_params, :headers => header_params, :form_params => form_params, :body => post_body, :token => token}).make.body
      obj = QueueList.new() and obj.build_from_hash(response)
    end

    # 
    # Get a queue&#39;s info
    # @param project_id The project that the queues belong to
    # @param queue_name Name of the queue
    # @param [Hash] opts the optional parameters
    # @return [QueueDataResponse]
    def get_queue_by_name(project_id, queue_name, opts = {})
      
      # verify the required parameter 'project_id' is set
      raise "Missing the required parameter 'project_id' when calling get_queue_by_name" if project_id.nil?
      
      # verify the required parameter 'queue_name' is set
      raise "Missing the required parameter 'queue_name' when calling get_queue_by_name" if queue_name.nil?
      

      # resource path
      path = "/{project_id}/queues/{queue_name}".sub('{format}','json').sub('{' + 'project_id' + '}', project_id.to_s).sub('{' + 'queue_name' + '}', queue_name.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      _header_accept = []
      _header_accept_result = Swagger::Request.select_header_accept(_header_accept) and header_params['Accept'] = _header_accept_result

      # HTTP header 'Content-Type'
      _header_content_type = []
      header_params['Content-Type'] = Swagger::Request.select_header_content_type(_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      
      auth_names = ['oauth_token']
      response = Swagger::Request.new(:GET, path, @host, {:params => query_params, :headers => header_params, :form_params => form_params, :body => post_body, :token => token}).make.body
      obj = QueueDataResponse.new() and obj.build_from_hash(response)
    end

    # 
    # Create a new queue
    # @param project_id The project that the new queue will belong to.
    # @param queue_name Name of the new queue.
    # @param [Hash] opts the optional parameters
    # @option opts [QueueInfo] :queue All fields are optional.
    # @return [QueueInfoResponse]
    def put_new_queue(project_id, queue_name, opts = {})
      
      # verify the required parameter 'project_id' is set
      raise "Missing the required parameter 'project_id' when calling put_new_queue" if project_id.nil?
      
      # verify the required parameter 'queue_name' is set
      raise "Missing the required parameter 'queue_name' when calling put_new_queue" if queue_name.nil?
      

      # resource path
      path = "/{project_id}/queues/{queue_name}".sub('{format}','json').sub('{' + 'project_id' + '}', project_id.to_s).sub('{' + 'queue_name' + '}', queue_name.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      _header_accept = []
      _header_accept_result = Swagger::Request.select_header_accept(_header_accept) and header_params['Accept'] = _header_accept_result

      # HTTP header 'Content-Type'
      _header_content_type = []
      header_params['Content-Type'] = Swagger::Request.select_header_content_type(_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = Swagger::Request.object_to_http_body(opts)
      
      auth_names = ['oauth_token']
      response = Swagger::Request.new(:PUT, path, @host, {:params => query_params, :headers => header_params, :form_params => form_params, :body => post_body, :token => token}).make.body
      obj = QueueInfoResponse.new() and obj.build_from_hash(response)
    end

    # 
    # Delete a queue
    # @param project_id The project that the queue belongs to
    # @param queue_name Name of queue to be deleted
    # @param [Hash] opts the optional parameters
    # @return [ResponseMessage]
    def delete_queue(project_id, queue_name, opts = {})
      
      # verify the required parameter 'project_id' is set
      raise "Missing the required parameter 'project_id' when calling delete_queue" if project_id.nil?
      
      # verify the required parameter 'queue_name' is set
      raise "Missing the required parameter 'queue_name' when calling delete_queue" if queue_name.nil?
      

      # resource path
      path = "/{project_id}/queues/{queue_name}".sub('{format}','json').sub('{' + 'project_id' + '}', project_id.to_s).sub('{' + 'queue_name' + '}', queue_name.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      _header_accept = []
      _header_accept_result = Swagger::Request.select_header_accept(_header_accept) and header_params['Accept'] = _header_accept_result

      # HTTP header 'Content-Type'
      _header_content_type = []
      header_params['Content-Type'] = Swagger::Request.select_header_content_type(_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      
      auth_names = ['oauth_token']
      response = Swagger::Request.new(:DELETE, path, @host, {:params => query_params, :headers => header_params, :form_params => form_params, :body => post_body, :token => token}).make.body
      obj = ResponseMessage.new() and obj.build_from_hash(response)
    end

    # 
    # Update a queue&#39;s information.
    # @param project_id The project that the queues belong to
    # @param queue_name Name of the queue
    # @param [Hash] opts the optional parameters
    # @option opts [QueueInfo] :queue The queue&#39;s options to be changed. Some fields will not be included if they are not applicable, such as push if it&#39;s not a push queue or alerts if there are no alerts
    # @return [QueueInfoResponse]
    def update_queue(project_id, queue_name, opts = {})
      
      # verify the required parameter 'project_id' is set
      raise "Missing the required parameter 'project_id' when calling update_queue" if project_id.nil?
      
      # verify the required parameter 'queue_name' is set
      raise "Missing the required parameter 'queue_name' when calling update_queue" if queue_name.nil?
      

      # resource path
      path = "/{project_id}/queues/{queue_name}".sub('{format}','json').sub('{' + 'project_id' + '}', project_id.to_s).sub('{' + 'queue_name' + '}', queue_name.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      _header_accept = []
      _header_accept_result = Swagger::Request.select_header_accept(_header_accept) and header_params['Accept'] = _header_accept_result

      # HTTP header 'Content-Type'
      _header_content_type = []
      header_params['Content-Type'] = Swagger::Request.select_header_content_type(_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = Swagger::Request.object_to_http_body(opts)
      
      auth_names = ['oauth_token']
      response = Swagger::Request.new(:PATCH, path, @host, {:params => query_params, :headers => header_params, :form_params => form_params, :body => post_body, :token => token}).make.body
      obj = QueueInfoResponse.new() and obj.build_from_hash(response)
    end

    # 
    # Peek messages on a queue
    # @param project_id The project that the queue belongs to
    # @param queue_name The name of the queue that you want to peek from
    # @param [Hash] opts the optional parameters
    # @option opts [int] :n The amount of messages you want to peek, defaults to 1
    # @return [MessageList]
    def get_messages(project_id, queue_name, opts = {})
      
      # verify the required parameter 'project_id' is set
      raise "Missing the required parameter 'project_id' when calling get_messages" if project_id.nil?
      
      # verify the required parameter 'queue_name' is set
      raise "Missing the required parameter 'queue_name' when calling get_messages" if queue_name.nil?
      

      # resource path
      path = "/{project_id}/queues/{queue_name}/messages".sub('{format}','json').sub('{' + 'project_id' + '}', project_id.to_s).sub('{' + 'queue_name' + '}', queue_name.to_s)

      # query parameters
      query_params = {}
      query_params[:'n'] = opts[:'n'] if opts[:'n']

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      _header_accept = []
      _header_accept_result = Swagger::Request.select_header_accept(_header_accept) and header_params['Accept'] = _header_accept_result

      # HTTP header 'Content-Type'
      _header_content_type = []
      header_params['Content-Type'] = Swagger::Request.select_header_content_type(_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      
      auth_names = ['oauth_token']
      response = Swagger::Request.new(:GET, path, @host, {:params => query_params, :headers => header_params, :form_params => form_params, :body => post_body, :token => token}).make.body
      obj = MessageList.new() and obj.build_from_hash(response)
    end

    # 
    # Add a set of messages to a single queue. Multiple messages may be added in a single request, provided that the messages should all be added to the same queue.
    # @param project_id The project that the queue belong&#39;s to.
    # @param queue_name Name of the queue that the messages are being added to.
    # @param [Hash] opts the optional parameters
    # @option opts [MessagePostDataList] :messages 
    # @return [MessageIdList]
    def post_messages(project_id, queue_name, opts = {})
      
      # verify the required parameter 'project_id' is set
      raise "Missing the required parameter 'project_id' when calling post_messages" if project_id.nil?
      
      # verify the required parameter 'queue_name' is set
      raise "Missing the required parameter 'queue_name' when calling post_messages" if queue_name.nil?
      

      # resource path
      path = "/{project_id}/queues/{queue_name}/messages".sub('{format}','json').sub('{' + 'project_id' + '}', project_id.to_s).sub('{' + 'queue_name' + '}', queue_name.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      _header_accept = []
      _header_accept_result = Swagger::Request.select_header_accept(_header_accept) and header_params['Accept'] = _header_accept_result

      # HTTP header 'Content-Type'
      _header_content_type = []
      header_params['Content-Type'] = Swagger::Request.select_header_content_type(_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = Swagger::Request.object_to_http_body(opts)
      
      auth_names = ['oauth_token']
      response = Swagger::Request.new(:POST, path, @host, {:params => query_params, :headers => header_params, :form_params => form_params, :body => post_body, :token => token}).make.body
      obj = MessageIdList.new() and obj.build_from_hash(response)
    end

    # 
    # Clear all messages from a queue or batch delete messages. This does not delete the queue.
    # @param project_id The project that the queue belongs to.
    # @param queue_name Name of the queue.
    # @param [Hash] opts the optional parameters
    # @option opts [DeleteMsgList] :messages A list of messages to be deleted. If the request is empty, all messages on the queue will be removed.\n
    # @return [ResponseMessage]
    def delete_messages(project_id, queue_name, opts = {})
      
      # verify the required parameter 'project_id' is set
      raise "Missing the required parameter 'project_id' when calling delete_messages" if project_id.nil?
      
      # verify the required parameter 'queue_name' is set
      raise "Missing the required parameter 'queue_name' when calling delete_messages" if queue_name.nil?
      

      # resource path
      path = "/{project_id}/queues/{queue_name}/messages".sub('{format}','json').sub('{' + 'project_id' + '}', project_id.to_s).sub('{' + 'queue_name' + '}', queue_name.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      _header_accept = []
      _header_accept_result = Swagger::Request.select_header_accept(_header_accept) and header_params['Accept'] = _header_accept_result

      # HTTP header 'Content-Type'
      _header_content_type = []
      header_params['Content-Type'] = Swagger::Request.select_header_content_type(_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = Swagger::Request.object_to_http_body(opts)
      
      auth_names = ['oauth_token']
      response = Swagger::Request.new(:DELETE, path, @host, {:params => query_params, :headers => header_params, :form_params => form_params, :body => post_body, :token => token}).make.body
      obj = ResponseMessage.new() and obj.build_from_hash(response)
    end

    # 
    # Get the info on a particular message in a queue
    # @param project_id The project that the queue belongs to.
    # @param queue_name The name of the queue.
    # @param message_id ID of the message
    # @param [Hash] opts the optional parameters
    # @return [SingleMessage]
    def get_message_by_id(project_id, queue_name, message_id, opts = {})
      
      # verify the required parameter 'project_id' is set
      raise "Missing the required parameter 'project_id' when calling get_message_by_id" if project_id.nil?
      
      # verify the required parameter 'queue_name' is set
      raise "Missing the required parameter 'queue_name' when calling get_message_by_id" if queue_name.nil?
      
      # verify the required parameter 'message_id' is set
      raise "Missing the required parameter 'message_id' when calling get_message_by_id" if message_id.nil?
      

      # resource path
      path = "/{project_id}/queues/{queue_name}/messages/{message_id}".sub('{format}','json').sub('{' + 'project_id' + '}', project_id.to_s).sub('{' + 'queue_name' + '}', queue_name.to_s).sub('{' + 'message_id' + '}', message_id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      _header_accept = []
      _header_accept_result = Swagger::Request.select_header_accept(_header_accept) and header_params['Accept'] = _header_accept_result

      # HTTP header 'Content-Type'
      _header_content_type = []
      header_params['Content-Type'] = Swagger::Request.select_header_content_type(_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      
      auth_names = ['oauth_token']
      response = Swagger::Request.new(:GET, path, @host, {:params => query_params, :headers => header_params, :form_params => form_params, :body => post_body, :token => token}).make.body
      obj = SingleMessage.new() and obj.build_from_hash(response)
    end

    # 
    # Delete a message off the queue
    # @param project_id The project that the queues belong to
    # @param queue_name Name of the queue
    # @param message_id ID of the message
    # @param [Hash] opts the optional parameters
    # @option opts [DeleteMsg] :message 
    # @return [ResponseMessage]
    def delete_message_by_id(project_id, queue_name, message_id, opts = {})
      
      # verify the required parameter 'project_id' is set
      raise "Missing the required parameter 'project_id' when calling delete_message_by_id" if project_id.nil?
      
      # verify the required parameter 'queue_name' is set
      raise "Missing the required parameter 'queue_name' when calling delete_message_by_id" if queue_name.nil?
      
      # verify the required parameter 'message_id' is set
      raise "Missing the required parameter 'message_id' when calling delete_message_by_id" if message_id.nil?
      

      # resource path
      path = "/{project_id}/queues/{queue_name}/messages/{message_id}".sub('{format}','json').sub('{' + 'project_id' + '}', project_id.to_s).sub('{' + 'queue_name' + '}', queue_name.to_s).sub('{' + 'message_id' + '}', message_id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      _header_accept = []
      _header_accept_result = Swagger::Request.select_header_accept(_header_accept) and header_params['Accept'] = _header_accept_result

      # HTTP header 'Content-Type'
      _header_content_type = []
      header_params['Content-Type'] = Swagger::Request.select_header_content_type(_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = Swagger::Request.object_to_http_body(opts)
      
      auth_names = ['oauth_token']
      response = Swagger::Request.new(:DELETE, path, @host, {:params => query_params, :headers => header_params, :form_params => form_params, :body => post_body, :token => token}).make.body
      obj = ResponseMessage.new() and obj.build_from_hash(response)
    end

    # 
    # Places a reserved message back on the queue after a delay.
    # @param project_id The project that the queues belong to
    # @param queue_name Name of the queue
    # @param message_id ID of the message
    # @param body 
    # @param [Hash] opts the optional parameters
    # @return [ResponseMessage]
    def release_message_by_id(project_id, queue_name, message_id, body, opts = {})
      
      # verify the required parameter 'project_id' is set
      raise "Missing the required parameter 'project_id' when calling release_message_by_id" if project_id.nil?
      
      # verify the required parameter 'queue_name' is set
      raise "Missing the required parameter 'queue_name' when calling release_message_by_id" if queue_name.nil?
      
      # verify the required parameter 'message_id' is set
      raise "Missing the required parameter 'message_id' when calling release_message_by_id" if message_id.nil?
      
      # verify the required parameter 'body' is set
      raise "Missing the required parameter 'body' when calling release_message_by_id" if body.nil?
      

      # resource path
      path = "/{project_id}/queues/{queue_name}/messages/{message_id}/release".sub('{format}','json').sub('{' + 'project_id' + '}', project_id.to_s).sub('{' + 'queue_name' + '}', queue_name.to_s).sub('{' + 'message_id' + '}', message_id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      _header_accept = []
      _header_accept_result = Swagger::Request.select_header_accept(_header_accept) and header_params['Accept'] = _header_accept_result

      # HTTP header 'Content-Type'
      _header_content_type = []
      header_params['Content-Type'] = Swagger::Request.select_header_content_type(_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = Swagger::Request.object_to_http_body(body)
      
      auth_names = ['oauth_token']
      response = Swagger::Request.new(:POST, path, @host, {:params => query_params, :headers => header_params, :form_params => form_params, :body => post_body, :token => token}).make.body
      obj = ResponseMessage.new() and obj.build_from_hash(response)
    end

    # 
    # Checks the push statuses across all subscribers for a message
    # @param project_id The project that the queues belong to
    # @param queue_name Name of the queue
    # @param message_id ID of the message
    # @param [Hash] opts the optional parameters
    # @return [PushStatusList]
    def get_subscriber_status_by_message_id(project_id, queue_name, message_id, opts = {})
      
      # verify the required parameter 'project_id' is set
      raise "Missing the required parameter 'project_id' when calling get_subscriber_status_by_message_id" if project_id.nil?
      
      # verify the required parameter 'queue_name' is set
      raise "Missing the required parameter 'queue_name' when calling get_subscriber_status_by_message_id" if queue_name.nil?
      
      # verify the required parameter 'message_id' is set
      raise "Missing the required parameter 'message_id' when calling get_subscriber_status_by_message_id" if message_id.nil?
      

      # resource path
      path = "/{project_id}/queues/{queue_name}/messages/{message_id}/subscribers".sub('{format}','json').sub('{' + 'project_id' + '}', project_id.to_s).sub('{' + 'queue_name' + '}', queue_name.to_s).sub('{' + 'message_id' + '}', message_id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      _header_accept = []
      _header_accept_result = Swagger::Request.select_header_accept(_header_accept) and header_params['Accept'] = _header_accept_result

      # HTTP header 'Content-Type'
      _header_content_type = []
      header_params['Content-Type'] = Swagger::Request.select_header_content_type(_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      
      auth_names = ['oauth_token']
      response = Swagger::Request.new(:GET, path, @host, {:params => query_params, :headers => header_params, :form_params => form_params, :body => post_body, :token => token}).make.body
      obj = PushStatusList.new() and obj.build_from_hash(response)
    end

    # 
    # Creates a new reservation for a message.
    # @param project_id The project that the queues belong to
    # @param queue_name Name of the queue
    # @param message_id ID of the message
    # @param [Hash] opts the optional parameters
    # @option opts [Touch] :message 
    # @return [TouchResponse]
    def touch_message_by_id(project_id, queue_name, message_id, opts = {})
      
      # verify the required parameter 'project_id' is set
      raise "Missing the required parameter 'project_id' when calling touch_message_by_id" if project_id.nil?
      
      # verify the required parameter 'queue_name' is set
      raise "Missing the required parameter 'queue_name' when calling touch_message_by_id" if queue_name.nil?
      
      # verify the required parameter 'message_id' is set
      raise "Missing the required parameter 'message_id' when calling touch_message_by_id" if message_id.nil?
      

      # resource path
      path = "/{project_id}/queues/{queue_name}/messages/{message_id}/touch".sub('{format}','json').sub('{' + 'project_id' + '}', project_id.to_s).sub('{' + 'queue_name' + '}', queue_name.to_s).sub('{' + 'message_id' + '}', message_id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      _header_accept = []
      _header_accept_result = Swagger::Request.select_header_accept(_header_accept) and header_params['Accept'] = _header_accept_result

      # HTTP header 'Content-Type'
      _header_content_type = []
      header_params['Content-Type'] = Swagger::Request.select_header_content_type(_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = Swagger::Request.object_to_http_body(opts)
      
      auth_names = ['oauth_token']
      response = Swagger::Request.new(:POST, path, @host, {:params => query_params, :headers => header_params, :form_params => form_params, :body => post_body, :token => token}).make.body
      obj = TouchResponse.new() and obj.build_from_hash(response)
    end

    # 
    # Reserve n amounts of messages from a queue
    # @param project_id The project that the queue belongs to
    # @param queue_name Name of the queue
    # @param [Hash] opts the optional parameters
    # @option opts [ReservationRequest] :options n: The maximum number of messages to get. Default is 1. Maximum is 100. Note: You may not receive all n messages on every request, the more sparse the queue, the less likely you are to receive all n messages.\ntimeout: After timeout (in seconds), item will be placed back onto queue. You must delete the message from the queue to ensure it does not go back onto the queue. If not set, value from queue is used. Default is 60 seconds, minimum is 30 seconds, and maximum is 86,400 seconds (24 hours).\nwait: Time to long poll for messages, in seconds. Max is 30 seconds. Default 0.\ndelete: swagger\n
    # @return [ReservationResponse]
    def reserve_messages(project_id, queue_name, opts = {})
      
      # verify the required parameter 'project_id' is set
      raise "Missing the required parameter 'project_id' when calling reserve_messages" if project_id.nil?
      
      # verify the required parameter 'queue_name' is set
      raise "Missing the required parameter 'queue_name' when calling reserve_messages" if queue_name.nil?
      

      # resource path
      path = "/{project_id}/queues/{queue_name}/reservations".sub('{format}','json').sub('{' + 'project_id' + '}', project_id.to_s).sub('{' + 'queue_name' + '}', queue_name.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      _header_accept = []
      _header_accept_result = Swagger::Request.select_header_accept(_header_accept) and header_params['Accept'] = _header_accept_result

      # HTTP header 'Content-Type'
      _header_content_type = []
      header_params['Content-Type'] = Swagger::Request.select_header_content_type(_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = Swagger::Request.object_to_http_body(opts)
      
      auth_names = ['oauth_token']
      response = Swagger::Request.new(:POST, path, @host, {:params => query_params, :headers => header_params, :form_params => form_params, :body => post_body, :token => token}).make.body
      obj = ReservationResponse.new() and obj.build_from_hash(response)
    end

    # 
    # Replaces the current subscribers on a push queue with a new list of subscribers Older subscribers will be removed.\n
    # @param project_id The project that the queues belong to.
    # @param queue_name Name of the push queue.
    # @param subscribers A list of subscribers that will be replacing the current list.
    # @param [Hash] opts the optional parameters
    # @return [ResponseMessage]
    def put_subscribers(project_id, queue_name, subscribers, opts = {})
      
      # verify the required parameter 'project_id' is set
      raise "Missing the required parameter 'project_id' when calling put_subscribers" if project_id.nil?
      
      # verify the required parameter 'queue_name' is set
      raise "Missing the required parameter 'queue_name' when calling put_subscribers" if queue_name.nil?
      
      # verify the required parameter 'subscribers' is set
      raise "Missing the required parameter 'subscribers' when calling put_subscribers" if subscribers.nil?
      

      # resource path
      path = "/{project_id}/queues/{queue_name}/subscribers".sub('{format}','json').sub('{' + 'project_id' + '}', project_id.to_s).sub('{' + 'queue_name' + '}', queue_name.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      _header_accept = []
      _header_accept_result = Swagger::Request.select_header_accept(_header_accept) and header_params['Accept'] = _header_accept_result

      # HTTP header 'Content-Type'
      _header_content_type = []
      header_params['Content-Type'] = Swagger::Request.select_header_content_type(_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = Swagger::Request.object_to_http_body(subscribers)
      
      auth_names = ['oauth_token']
      response = Swagger::Request.new(:PUT, path, @host, {:params => query_params, :headers => header_params, :form_params => form_params, :body => post_body, :token => token}).make.body
      obj = ResponseMessage.new() and obj.build_from_hash(response)
    end

    # 
    # Add a new subscriber to a push queue or update an existing subscriber
    # @param project_id The project that the queues belong to
    # @param queue_name Name of the push queue.
    # @param subscribers A list of subscribers to be added or updated.
    # @param [Hash] opts the optional parameters
    # @return [ResponseMessage]
    def post_subscribers(project_id, queue_name, subscribers, opts = {})
      
      # verify the required parameter 'project_id' is set
      raise "Missing the required parameter 'project_id' when calling post_subscribers" if project_id.nil?
      
      # verify the required parameter 'queue_name' is set
      raise "Missing the required parameter 'queue_name' when calling post_subscribers" if queue_name.nil?
      
      # verify the required parameter 'subscribers' is set
      raise "Missing the required parameter 'subscribers' when calling post_subscribers" if subscribers.nil?
      

      # resource path
      path = "/{project_id}/queues/{queue_name}/subscribers".sub('{format}','json').sub('{' + 'project_id' + '}', project_id.to_s).sub('{' + 'queue_name' + '}', queue_name.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      _header_accept = []
      _header_accept_result = Swagger::Request.select_header_accept(_header_accept) and header_params['Accept'] = _header_accept_result

      # HTTP header 'Content-Type'
      _header_content_type = []
      header_params['Content-Type'] = Swagger::Request.select_header_content_type(_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = Swagger::Request.object_to_http_body(subscribers)
      
      auth_names = ['oauth_token']
      response = Swagger::Request.new(:POST, path, @host, {:params => query_params, :headers => header_params, :form_params => form_params, :body => post_body, :token => token}).make.body
      obj = ResponseMessage.new() and obj.build_from_hash(response)
    end

    # 
    # Remove one or multiple subscribers from a push queue.
    # @param project_id The project that the queues belong to
    # @param queue_name Name of the push queue
    # @param subscribers 
    # @param [Hash] opts the optional parameters
    # @return [ResponseMessage]
    def delete_subscribers(project_id, queue_name, subscribers, opts = {})
      
      # verify the required parameter 'project_id' is set
      raise "Missing the required parameter 'project_id' when calling delete_subscribers" if project_id.nil?
      
      # verify the required parameter 'queue_name' is set
      raise "Missing the required parameter 'queue_name' when calling delete_subscribers" if queue_name.nil?
      
      # verify the required parameter 'subscribers' is set
      raise "Missing the required parameter 'subscribers' when calling delete_subscribers" if subscribers.nil?
      

      # resource path
      path = "/{project_id}/queues/{queue_name}/subscribers".sub('{format}','json').sub('{' + 'project_id' + '}', project_id.to_s).sub('{' + 'queue_name' + '}', queue_name.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      _header_accept = []
      _header_accept_result = Swagger::Request.select_header_accept(_header_accept) and header_params['Accept'] = _header_accept_result

      # HTTP header 'Content-Type'
      _header_content_type = []
      header_params['Content-Type'] = Swagger::Request.select_header_content_type(_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = Swagger::Request.object_to_http_body(subscribers)
      
      auth_names = ['oauth_token']
      response = Swagger::Request.new(:DELETE, path, @host, {:params => query_params, :headers => header_params, :form_params => form_params, :body => post_body, :token => token}).make.body
      obj = ResponseMessage.new() and obj.build_from_hash(response)
    end

    # 
    # Send a set of messages to the webhook endpoint.
    # @param project_id The project that the queues belong to
    # @param queue_name Name of the queue
    # @param [Hash] opts the optional parameters
    # @option opts [MessagePostDataList] :messages 
    # @return [nil]
    def post_webhook(project_id, queue_name, opts = {})
      
      # verify the required parameter 'project_id' is set
      raise "Missing the required parameter 'project_id' when calling post_webhook" if project_id.nil?
      
      # verify the required parameter 'queue_name' is set
      raise "Missing the required parameter 'queue_name' when calling post_webhook" if queue_name.nil?
      

      # resource path
      path = "/{project_id}/queues/{queue_name}/webhook".sub('{format}','json').sub('{' + 'project_id' + '}', project_id.to_s).sub('{' + 'queue_name' + '}', queue_name.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      _header_accept = []
      _header_accept_result = Swagger::Request.select_header_accept(_header_accept) and header_params['Accept'] = _header_accept_result

      # HTTP header 'Content-Type'
      _header_content_type = []
      header_params['Content-Type'] = Swagger::Request.select_header_content_type(_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = Swagger::Request.object_to_http_body(opts)
      
      auth_names = ['oauth_token']
      Swagger::Request.new(:POST, path, {:params => query_params,:headers => header_params, :form_params => form_params, :body => post_body, :auth_names => auth_names}).make
      nil
    end
  end
end
