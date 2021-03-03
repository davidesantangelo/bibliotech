class PublishersController < BaseController
  # constants
  SERIALIZER_CLASS = Serializer::PUBLISHER

  # callbacks
  before_action :set_publisher, only: [:show]

  # GET /publishers
  def index
    @pagy, @publishers = pagy Publisher.all

    json_response_with_serializer(@publishers, SERIALIZER_CLASS)
  end

  # GET /publishers/{ID}
  def show
    json_response_with_serializer(@publisher, SERIALIZER_CLASS)
  end

  # POST /publishers
  def create
    @publisher = Publisher.new(publisher_params)

    json_error_response('PublisherCreateError', @publisher.errors, 500) && return unless @publisher.save

    json_response_with_serializer(@publisher, SERIALIZER_CLASS)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_publisher
    @publisher = Publisher.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def publisher_params
    params.require(:publisher).permit(:name, :phone, :address)
  end
end
