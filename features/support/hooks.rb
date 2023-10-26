Before do
  # Clear all queues before each example
  ActiveJob::Base.queue_adapter.enqueued_jobs.clear
end
