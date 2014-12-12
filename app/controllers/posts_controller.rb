class PostsController < ApplicationController

  def index
    @collection = Post.latest.page(params[:page])

    render json: @collection
  end

  def show
    @collection = PostsByDate.new(params).fetch

    render json: @collection
  end

end