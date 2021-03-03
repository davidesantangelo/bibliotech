class AuthorsController < BaseController
  # constants
  SERIALIZER_CLASS = Serializer::AUTHOR

  # callbacks
  before_action :set_author, only: [:show]

  # GET /authors
  def index
    @pagy, @authors = pagy Author.all

    json_response_with_serializer(@authors, SERIALIZER_CLASS)
  end

  # GET /authors/{ID}
  def show
    json_response_with_serializer(@author, SERIALIZER_CLASS)
  end

  # POST /authors
  def create
    @author = Author.new(author_params)

    json_error_response('AuthorCreateError', @author.errors, 500) && return unless @author.save

    json_response_with_serializer(@author, SERIALIZER_CLASS)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_author
    @author = Author.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def author_params
    params.require(:author).permit(:first_name, :last_name, :email, :birthdate)
  end
end
