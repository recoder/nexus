module Tiny::UrlsHelper
  def short_url(tiny_url)
    follow_tiny_url(tiny_url)
  end

  def short_uni_url(tiny_url)
    follow_uni_tiny_url(tiny_url)
  end

  def short_preview_url(tiny_url)
    short_url(tiny_url) # TODO: better URL
  end
end
