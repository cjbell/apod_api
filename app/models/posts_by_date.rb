class PostsByDate
  attr_accessor :params

  def initialize(params)
    @params = params
  end

  def fetch
    posts
  end

private

  def date
    @date ||= DateTime.new(*date_params)
  end

  def date_params
    date_params = []

    %i(year month day).each do |value|
      date_params.push params[value].to_i if params[value]
    end

    date_params
  end

  def query_type
    if params[:year] && params[:month] && params[:day]
      :day
    elsif params[:year] && params[:month]
      :month
    elsif params[:year]
      :year
    end
  end

  def posts
    @posts ||= begin
      case query_type
      when :year
        Post.posted.in_year(date).page(params[:page])
      when :month
        Post.posted.in_month(date)
      when :day
        Post.on_day(date)
      end
    end
  end
end