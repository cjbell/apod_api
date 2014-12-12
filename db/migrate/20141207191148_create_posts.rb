class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string    :name
      t.text      :description_html
      t.text      :credit_html
      t.string    :original_url
      t.string    :small_image_url
      t.string    :video_embed_url
      t.string    :full_image_url
      t.datetime  :published_at

      t.timestamps
    end
  end
end
