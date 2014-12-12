namespace :fetcher do
  desc "Fetch all posts"
  task all: :environment do
    start_date = DateTime.new(1995, 6, 16)
    end_date = DateTime.now

    (start_date..end_date).each do |date|
      PostFetcherWorker.perform_async(date.to_s)
    end
  end

  desc "Fetch todays post"
  task today: :environment do
    PostFetcherWorker.perform_async(DateTime.now.to_s)
  end
end
