require 'rails_helper'

RSpec.describe "Creating a Talk", type: :request do
  let(:organizer) { User.create username: "corey" }
  let(:event_params) { {title: "Example Event"} }
  let(:event) { organizer.create_event event_params }
  context "With no talks accepted for the event" do
    it "Shows a message about no talks registered yet" do

      get event_path(event)

      expect(response).to have_http_status(200)
      expect(response.body).to match("Example Event")
    end
  end

  context "With talks accepted for the event" do
    it "Shows the talks" do
      talk1 = event.submit_talk topic: "Example Topic 1", email: "corey@example.com", presenter_name: "Corey"
      talk2 = event.submit_talk topic: "Example Topic 2", email: "corey@example.com", presenter_name: "Corey"

      get event_path(event)

      expect(response.body).to match(talk1.topic)
      expect(response.body).to match(talk2.topic)
    end
  end
end
