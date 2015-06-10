class PostSerializer < ActiveModel::Serializer
  include ActionView::Helpers::SanitizeHelper


  attributes :name, :description, :credit,
             :small_image_url, :full_image_url, :video_embed_url,
             :original_url, :published_at

  def published_at
    object.published_at.strftime("%Y-%m-%d")
  end

  def description
    strip_tags(object.description_html)
      .sub('Explanation:', '')
      .gsub("\n", ' ')
      .gsub('  ', "\n")
      .strip
  end

  def credit
    strip_tags(object.credit_html).strip
      .gsub('&amp;', "&")
  end
end
