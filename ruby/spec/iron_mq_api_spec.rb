require 'spec_helper'

describe IronSdk::IronMQApi do
  before(:each) do
    @project_id  = "556e330f0692e80009000029"
    @q = 'test'
    @push_q = 'testpush'
    @api_key = "SSoodOf7DCcTjzco70jK"
  end

  before do
    IronSdk::Swagger.configure do |c|
      c.auth_token = @api_key
    end
  end

  describe "#get_queues" do
    it "should return a list of queues" do
      res = IronSdk::IronMQApi.get_queues(@project_id)
      expect(res.queues.size).to eq 2
    end
  end

  describe "#get_queue_by_name" do
    it "should return a single queue" do
      res = IronSdk::IronMQApi.get_queue_by_name(@project_id, @q)
      expect(res.queue.name).to eq @q
      expect(res.queue.project_id).to eq @project_id
    end
  end

  describe "#get_messages" do
    before(:each) do
      IronSdk::IronMQApi.post_messages @project_id, @q,
        {messages: [{body: "asdf"}, {body: "asdf"}, {body: "adsfasdf"}]}
    end

    it "should return a single message" do
      res = IronSdk::IronMQApi.get_messages @project_id, @q
      expect(res.messages.size).to eq 1
    end

    it "should return multiple messages given n" do
      res = IronSdk::IronMQApi.get_messages @project_id, @q, {n: 3}
      expect(res.messages.size).to eq 3
    end
  end
  describe "#post_messages" do
    it "should return a list of added messages" do
      messages = {messages: [{body: "test1"}, {body: "test2"}]}
      res = IronSdk::IronMQApi.post_messages @project_id, @q, messages

      expect(res.ids.size).to eq 2
    end
  end

  describe "#get_message_by_id" do
    it "should return a single message" do
      message = {messages: [{body: "message_by_id"}]}
      res = IronSdk::IronMQApi.post_messages @project_id, @q, message

      id = res.ids.first
      res = IronSdk::IronMQApi.get_message_by_id @project_id, @q, id
      expect(res.message.id).to eq id
      expect(res.message.body).to eq "message_by_id"
    end
  end

  describe "#update_queue" do
    it "should update the info on a queue" do
      # Changes it from 60 to 30
      opts = {queue: {:message_timeout => 30}}
      res = IronSdk::IronMQApi.update_queue @project_id, 'test', opts
      expect(res.queue.message_timeout).to eq 30

      opts = {queue: {:message_timeout => 60}}
      res = IronSdk::IronMQApi.update_queue @project_id, 'test', opts
      expect(res.queue.message_timeout).to eq 60
    end
  end

  describe "add and delete queue" do
    it "should delete a queue" do
      name = "delete_q"
      IronSdk::IronMQApi.put_new_queue @project_id, name
      res = IronSdk::IronMQApi.delete_queue @project_id, name
      expect(res.msg).to eq "Deleted."
    end
  end

  describe "reserve and release messages" do
    it "should reserve n messages" do
      messages = { messages:
                   [{body: "1"},
                    {body: "2"},
                    {body: "3"}]}
     IronSdk::IronMQApi.post_messages @project_id, @q, messages

     res = IronSdk::IronMQApi.reserve_messages @project_id, @q, {n: 2}
     expect(res.messages.size).to eq 2

     res.messages.each do |m|
       res = IronSdk::IronMQApi.release_message_by_id @project_id, @q, m.id, {reservation_id: m.reservation_id,delay: 30}
       expect(res.msg).to eq "Released"
     end
    end
  end

  describe "#delete_messages" do
    before(:each) do
      messages = { messages:
                   [{body: "1"},
                    {body: "2"},
                    {body: "3"}]}
      IronSdk::IronMQApi.post_messages @project_id, @q, messages
    end

    context "without messages" do
      it "should clear the queue" do
        response = IronSdk::IronMQApi.get_queue_by_name @project_id, @q
        expect(response.queue.size).to be >= 3

        delete_response = IronSdk::IronMQApi.delete_messages @project_id, @q
        expect(delete_response.msg).to eq "Cleared"

        res = IronSdk::IronMQApi.get_queue_by_name @project_id, @q
        expect(res.queue.size).to eq 0
      end
    end

    context "with messages" do
      it "should delete a batch of messages" do
        reserved_messages = IronSdk::IronMQApi.reserve_messages @project_id, @q, {n: 3}
        delete_messages = reserved_messages.messages.collect{|m| {id: m.id, reservation_id: m.reservation_id}  }

        response = IronSdk::IronMQApi.delete_messages @project_id, @q, {ids: delete_messages}
        expect(response.msg).to eq "Deleted"
      end
    end
  end

  describe "#delete_message_by_id" do
    it "should delete a single message given its id" do
      IronSdk::IronMQApi.post_messages @project_id, @q, {messages: [{body: "test123"}]}
      reserved_message = IronSdk::IronMQApi.reserve_messages(@project_id, @q).messages.first
      res = IronSdk::IronMQApi.delete_message_by_id(@project_id, @q,
                                                       reserved_message.id,
                                                       {reservation_id: reserved_message.reservation_id})
      expect(res.msg).to eq "Deleted"

      # make sure the message doesnt exist
      expect{IronSdk::IronMQApi.get_message_by_id(@project_id, @q, reserved_message.id)}.
        to raise_error(IronSdk::ClientError)
    end
  end

  describe "#touch_message_by_id" do
    it "should return a new reservation" do
      IronSdk::IronMQApi.post_messages(@project_id, @q, {messages: [{body: "test123"}]})
      res = IronSdk::IronMQApi.reserve_messages @project_id, @q
      m = res.messages.first

      updated_reservation = IronSdk::IronMQApi.touch_message_by_id(@project_id, @q, m.id, {reservation_id: m.reservation_id, delay: 120})

      expect(updated_reservation.msg).to eq "Touched"
      expect(updated_reservation.reservation_id).to_not eq m.reservation_id
    end
  end

  describe "#add_alert" do
    it "should add an alert" do
      alert = { alerts: [ { type: "fixed", direction: "asc", trigger: 5, queue: "test"}]}
      res = IronSdk::IronMQApi.add_alert(@project_id, 'testpush', alert)
      expect(res.msg).to eq "Alerts were added."
    end
  end

  describe "#delete_alerts" do
    it "should delete an alert" do
      alert = { alerts: [ { type: "fixed", direction: "asc", trigger: 5, queue: "test"}]}
      res = IronSdk::IronMQApi.delete_alerts(@project_id, 'testpush', alert)
      expect(res.msg).to eq "Alerts were deleted."
    end
  end

  describe "#put_alerts" do
    it "should replace the alerts" do
      alert = { alerts: [ { type: "fixed", direction: "asc", trigger: 5, queue: "test"}]}
      res = IronSdk::IronMQApi.put_alerts(@project_id, 'testpush', alert)
      expect(res.msg).to eq "Alerts were replaced."
    end
  end

  describe "#post_subscribers and #put_subscribers" do
    it "should add a subscriber" do
      subscribers = {subscribers: [{
        name: "test",
        url: "test-url.com",
      }]}

      res = IronSdk::IronMQApi.put_subscribers @project_id, 'testpush', subscribers
      expect(res.msg).to eq "Updated"

      post_res= IronSdk::IronMQApi.post_subscribers @project_id, 'testpush', subscribers
      expect(post_res.msg).to eq "Updated"
    end
  end

  describe "#delete_subscribers" do
    it "should delete a list of subscribers" do
      subscribers = { subscribers: [
        {name: "test",
        url: "test-url.com",
      }, {
          name: "test2",
          url: "test-url2.com"
        }]}
      put_res = IronSdk::IronMQApi.put_subscribers @project_id, 'testpush', subscribers
      expect(put_res.msg).to eq "Updated"

      res = IronSdk::IronMQApi.delete_subscribers @project_id, 'testpush', {subscribers: [{name: "test2"}]}
      expect(res.msg).to eq "Updated"

      subs = IronSdk::IronMQApi.get_queue_by_name(@project_id, 'testpush').queue.push.subscribers
      expect(subs.size).to eq 1

    end
  end
end
