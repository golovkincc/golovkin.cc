# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = 'https://golovkin.cc'
SitemapGenerator::Sitemap.search_engines[:yandex] = "http://blogs.yandex.ru/pings/?status=success&url=%s"
SitemapGenerator::Sitemap.public_path = 'public/'
SitemapGenerator::Sitemap.compress = :all_but_first
SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
  group(:sitemaps_path => 'uploads/sitemap/en/', :filename => :english, :compress => true) do
    add root_en_path
    add about_en_path, :priority => 0.5
    add contacts_en_path, :priority => 0.7
  end

  group(:sitemaps_path => 'uploads/sitemap/ru/', :filename => :russian, :compress => true) do
    add root_ru_path
    add about_ru_path, :priority => 0.5
    add contacts_ru_path, :priority => 0.7
  end
end
