class UrlsController < ApplicationController
  def index
  end

  def new
  end

  def create
    begin
      retries ||= 0

      code = Url.generate_code
      @url = Url.create(url: params[:url], short_hash: code)
    rescue
      retry if (retries += 1) < 3
    end
  end

  def show
    record = Url.find_by_short_hash(params[:id])
    raise ActionController::RoutingError.new('Not Found') if record.blank?

    record.increment!(:views_count)

    redirect_to(record.url)
  end

  def stats
    @url = Url.find_by_short_hash(params[:id])
    raise ActionController::RoutingError.new('Not Found') if @url.blank?
  end
end
