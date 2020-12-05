class UrlConnectorsController < ApplicationController
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
