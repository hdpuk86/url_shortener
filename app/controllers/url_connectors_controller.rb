class UrlConnectorsController < ApplicationController
  skip_before_action :authenticate_user!, only: :connector
  before_action :set_url_connector, only: :destroy

  # GET /url_connectors
  def index
    @url_connectors = current_user.url_connectors
  end

  # GET /url_connectors/new
  def new
    @url_connector = current_user.url_connectors.build
  end

  # POST /url_connectors
  def create
    @url_connector = current_user.url_connectors.build(url_connector_params)
    if @url_connector.save
      redirect_to url_connectors_url, notice: 'Url connector was successfully created.'
    else
      render :new
    end
  end

  # DELETE /url_connectors/1
  def destroy
    @url_connector.destroy
    redirect_to url_connectors_url, notice: 'Url connector was successfully destroyed.'
  end

  # GET /R_ANDM
  def connector
    short_url_ref = root_url + params[:short_url_ref]
    # find_by protects from sql injections: https://guides.rubyonrails.org/security.html#sql-injection
    url_connector = UrlConnector.find_by(short_url: short_url_ref)
    if url_connector.present? && url_connector.increment!(:visit_count)
      redirect_to url_connector.long_url, status: 301
    else
      redirect_to root_url
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_url_connector
      @url_connector = current_user.url_connectors.find_by(id: params[:id])
      return redirect_to url_connectors_url, flash: { alert: 'URL could not be found.' } unless @url_connector.present?
    end

    # Only allow a list of trusted parameters through.
    def url_connector_params
      params.require(:url_connector).permit(:long_url)
    end
end
