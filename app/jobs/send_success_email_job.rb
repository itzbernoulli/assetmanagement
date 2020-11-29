class SendSuccessEmailJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    p "*********************"
    p "Sending Success Email"
    p "*********************"
  end
end
