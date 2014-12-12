require_relative '../../lib/fetcher/post'

class PostFetcherWorker
  include Sidekiq::Worker

  def perform(date)
    begin
      raw_post = Fetcher::Post.new(DateTime.parse(date))
      Post.create(raw_post.to_hash)
    rescue Exception => e
      logger.error "Error with fetch for #{date}"
      logger.error e.message
      logger.error e.backtrace.inspect
    end
  end
end