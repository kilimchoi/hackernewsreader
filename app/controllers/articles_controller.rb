class ArticlesController < ApplicationController
  def index
    rss_url = "https://news.ycombinator.com/rss"
    feed = Feedjira::Feed.fetch_and_parse rss_url
    feed.entries.each do |entry|
      Article.create(headline: entry.title, url: entry.url) if !Article.find_by_url_and_headline(entry.url, entry.title)
    end
    @articles = Article.order(:created_at)
  end
end
