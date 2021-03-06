# Getting Started

1. Install the gem
```ruby
gem install iron_client
```

2. Set up your credentials and host
```ruby
# HOST defaults to mq-aws-us-east-1-1.iron.io if left blank
ironmq = IronSdk::IronMQApi.new(AUTH_TOKEN, HOST)
```

From there, you can make function calls to the api like so

```ruby

# Let's post a few messages onto a queue
messages = { messages:
              [{
                body: "Message 1"
              }, {
                body: "Message 2"
              }]}

# Post the messages
response = ironmq.post_messages(PROJECT_ID, QUEUE_NAME, messages)

# Here are the ids of the messages we just posted
id_list = response.ids

# Let's grab a set of reserved messages
res = ironmq.reserve_messages(PROJECT_ID, QUEUE_NAME, {n: 5})
messages = res.messages

messages.each do |m|
  puts "#{m.id}: #{m.body}"
end

# Lets delete these messages from the queue
ids = reserved_messages.messages.collect{|m| {id: m.id, reservation_id: m.reservation_id} }
ironmq.delete_messages PROJECT_ID, QUEUE_NAME, {ids: ids}
```
