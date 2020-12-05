class UrlConnectorsController < ApplicationController
  before_action :set_url_connector, only: [:show, :edit, :update, :destroy]

  # GET /url_connectors
  def index
    @url_connectors = UrlConnector.all
  end

  # GET /url_connectors/1
  def show
  end

  # GET /url_connectors/new
  def new
    @url_connector = UrlConnector.new
  end

  # GET /url_connectors/1/edit
  def edit
  end

  # POST /url_connectors
  def create
    @url_connector = UrlConnector.new(url_connector_params)
    if @url_connector.save
      redirect_to @url_connector, notice: 'Url connector was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /url_connectors/1
  def update
    if @url_connector.update(url_connector_params)
      redirect_to @url_connector, notice: 'Url connector was successfully updated.'
    else
      render :edit
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
      @url_connector = UrlConnector.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def url_connector_params
      params.require(:url_connector).permit(:long_url, :short_url)
    end
end
