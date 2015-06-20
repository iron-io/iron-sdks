# Swagger common files
require 'iron_sdk/monkey'
require 'iron_sdk/swagger'
require 'iron_sdk/swagger/configuration'
require 'iron_sdk/swagger/request'
require 'iron_sdk/swagger/response'
require 'iron_sdk/swagger/version'

# Models
require 'iron_sdk/models/base_object'
require 'iron_sdk/models/response_message'
require 'iron_sdk/models/delete_msg'
require 'iron_sdk/models/delete_msg_list'
require 'iron_sdk/models/message'
require 'iron_sdk/models/message_list'
require 'iron_sdk/models/single_message'
require 'iron_sdk/models/message_id_list'
require 'iron_sdk/models/message_post_data_list'
require 'iron_sdk/models/message_post_data'
require 'iron_sdk/models/queue_list'
require 'iron_sdk/models/queue_name'
require 'iron_sdk/models/subscriber'
require 'iron_sdk/models/subscriber_list'
require 'iron_sdk/models/reservation_request'
require 'iron_sdk/models/release'
require 'iron_sdk/models/touch'
require 'iron_sdk/models/touch_response'
require 'iron_sdk/models/reservation_response'
require 'iron_sdk/models/push_status'
require 'iron_sdk/models/push_status_list'
require 'iron_sdk/models/queue_info'
require 'iron_sdk/models/queue_info_response'
require 'iron_sdk/models/queue_data_response'
require 'iron_sdk/models/queue_data'
require 'iron_sdk/models/alert'
require 'iron_sdk/models/alert_list'
require 'iron_sdk/models/push'
require 'iron_sdk/models/queue_subscriber'
require 'iron_sdk/models/messages_request'

# APIs
require 'iron_sdk/api/iron_mq_api'

module IronSdk
  # Initialize the default configuration
  Swagger.configuration ||= Swagger::Configuration.new
end
