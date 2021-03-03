class BooksController < BaseController
  # constants
  SERIALIZER_CLASS = Serializer::BOOK
  SERIALIZER_LIST_CLASS = Serializer::BOOK_LIST

  # callbacks
  before_action :set_author, except: [:list]
  before_action :set_book, only: %i[show update destroy]

  # GET /books OR /authors/{AUTHOR_ID}/books
  def index
    @pagy, @books = pagy books

    json_response_with_serializer(@books, @author ? SERIALIZER_CLASS : SERIALIZER_LIST_CLASS)
  end

  # GET /authors/{AUTHOR_ID}/books/{ID}
  def show
    json_response_with_serializer(@book, SERIALIZER_CLASS)
  end

  # POST /authors/{AUTHOR_ID}/books
  def create
    @book = books.new(book_params)

    json_error_response('BookCreateError', @book.errors, 500) && return unless @book.save

    json_response_with_serializer(@book, SERIALIZER_CLASS)
  end

  # PATCH/PUT /authors/{AUTHOR_ID}/books/{ID}
  def update
    json_error_response('BookUpdateError', @book.errors, 500) && return unless @book.update(book_params)

    json_response_with_serializer(@book, SERIALIZER_CLASS)
  end

  # DELETE /authors/{AUTHOR_ID}/books/{ID}
  def destroy
    @book.destroy
  end

  private

  def set_author
    @author = Author.find_by(id: params[:author_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = books.find(params[:id])
  end

  def books
    @author ? @author.books : Book.visible
  end

  # Only allow a list of trusted parameters through.
  def book_params
    params.require(:book).permit(:title, :description, :visibility, :isbn).tap do |whitelisted|
      whitelisted[:publisher_id] = params.dig(:book, :publisher, :id)
    end
  end
end
