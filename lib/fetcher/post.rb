require 'nokogiri'
require 'rest_client'

module Fetcher
  class Post

    URL_BASE = "http://apod.nasa.gov/apod/"
    PAGE_FORMAT = "ap%y%m%d.html"

    def initialize(date)
      @date = date
    end

    def name
      page.css('b')[0].text.strip!
    end

    def credit
      credit_title_block = page.css('b')[1].parent.to_html

      # Remove '<center> tags'
      credit_title_block.gsub!('<center>', '')
      credit_title_block.gsub!('</center>', '')

      # Remove title <b> name <b> <br>
      credit_title_block.gsub!(page.css('b')[0].to_html, '')
      credit_title_block.gsub!("<br>", '')
      credit_title_block.gsub!(/\n/, '')
    end

    def small_image_url
      if page.css('img').any?
        "#{URL_BASE}#{page.css('img')[0]['src']}"
      end
    end

    def full_image_url
      if page.css('img').any?
        "#{URL_BASE}#{page.css('img')[0].parent['href']}"
      end
    end

    def video_embed_url
      if page.css('iframe').any?
        page.css('iframe')[0]['src']
      elsif page.css('embed').any?
        page.css('embed')[0]['src']
      end
    end

    def description
      page.css('p')[2].to_html
    end

    def to_hash
      { name: name,
        credit_html: credit,
        description_html: description,
        full_image_url: full_image_url,
        small_image_url: small_image_url,
        video_embed_url: video_embed_url,
        original_url: fetch_url,
        published_at: @date }
    end

  private

    def page
      @page ||= Nokogiri::HTML(RestClient.get(fetch_url))
    end

    def fetch_url
      "#{URL_BASE}#{@date.strftime(PAGE_FORMAT)}"
    end

  end
end