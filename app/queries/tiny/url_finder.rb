# Query builder for accessing TinyURLs

class Tiny::UrlFinder
  def initialize(initial_scope = nil)
    @initial_scope = initial_scope || Tiny::Url.all
  end

  def call(params)
    scoped = @initial_scope
    scoped = filter_by_url(scoped, params[:url])
    scoped = filter_by_slug(scoped, params[:slug])
    # scoped = paginate(scoped, params[:page])
    scoped
  end

private

  def filter_by_url(scoped, query = nil)
    query ? scoped.where.like(url: "%#{query}%") : scoped
  end

  def filter_by_slug(scoped, query = nil)
    query ? scoped.where.like(slug: "%#{query}%") : scoped
  end
end
