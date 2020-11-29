class VeryLongTaskJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    p "*********************"
    p "Performing Very long Task"
    p "*********************"
    sleep 60
    true
    p "*********************"
    p "Done performing very long task"
    p "*********************"
    SendSuccessEmailJob.perform_later
  end
end
