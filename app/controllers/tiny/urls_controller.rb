class Tiny::UrlsController < ApplicationController
  before_action :authenticate_user!, except: [:follow]
  before_action :set_tiny_url, only: [:show]
  before_action :find_tiny_url, only: [:follow]

  responders :flash, :http_cache
  respond_to :html
  # respond_to :html, only: :create
  # before_action :verify_requested_format!

  def index
    @tiny_urls = Tiny::UrlFinder.new.call(tiny_url_query_params)
    respond_with @tiny_urls
  end

  def show
  end

  def new
    @tiny_url = Tiny::Url.new
    respond_to :html
  end

  def create
    # unless params[:slug].blank?
    # if params[:slug] too long -> raise
    # end
    @tiny_url = find_existing(params[:tiny_url][:slug], params[:tiny_url][:url]) ||
                current_user.tiny_urls.build(tiny_url_params)

    flash[:notice] = 'URL was successfully shortened.' if @tiny_url.save

    respond_with @tiny_url
  end

  def follow
    unless @tiny_url
      not_found
    end

    @tiny_url.hit

    unless @tiny_url.banned?
      redirect_to @tiny_url.url, status: :moved_permanently
    else
      not_found
    end
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_tiny_url
    @tiny_url = Tiny::Url.find(params[:id])
  end

  def find_tiny_url
    @tiny_url = Tiny::Url.find_by_slug(params[:slug])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def tiny_url_params
    params.require(:tiny_url).permit(:slug, :url)
  end

  def tiny_url_query_params
    params.permit(:slug, :url)
  end

  def normalize_url(url)
    url # TODO: anything?
  end

  def find_existing(slug, url)
    if slug.blank?
      return Tiny::Url.find_by_url(url)
    end
    if Tiny::Url.find_by_slug(slug)
      raise # TODO: duplicate slug
    end
  end
end
