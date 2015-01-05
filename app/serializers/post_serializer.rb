class PostSerializer < ActiveModel::Serializer
  attributes :name, :description_html, :credit_html,
             :small_image_url, :full_image_url, :video_embed_url,
             :original_url, :published_at

  def published_at
    object.published_at.strftime("%Y-%m-%d")
  end
end
