class AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :edit, :update, :destroy]

  # GET /authors
  # GET /authors.json
  def index
    @authors = Author.all
  end

  # GET /authors/1
  # GET /authors/1.json
  def show
  end

  # GET /authors/new
  def new
    @author = Author.new
    get_books
    respond_to do |format|
    format.html
    format.json { render json: @author }
  end

  end

  # GET /authors/1/edit
  def edit
    get_books
  end
  # POST /authors
  # POST /authors.json
  def create

    @author = Author.new(author_params)
    params[:books][:id].each do |book|
      if !book.empty?
        @author.authorbooks.build(:book_id => book)
      end
    end

    #binding.pry
    respond_to do |format|
      if @author.save

       # author_id = @author.id
       # create_params[:book_id].each do |bookid|
       #  @authorbooks = Authorbook.new(author_id: author_id, book_id: bookid)
       #  @authorbooks.save
       # end

        # author_id = @author.id
        # author_book = params[:book].split(',')
        # ab_ids = Book.where(name: author_book).pluck('id')
        # ab_ids.each do |id|
        # author_books = Authorbook.new(author_id: author_id, book_id: id)
        # author_books.save
 
        format.html { redirect_to @author, notice: 'Author was successfully created.' }
        format.json { render :show, status: :created, location: @author }
      else
        format.html { render :new }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /authors/1
  # PATCH/PUT /authors/1.json
  def update
    #binding.pry
    respond_to do |format|
      if @author.update(author_params)
        
        @author.books = []
        params[:books][:id].each do |book|
          if !book.empty?
            @author.books << Book.find(book)
          end
        end
        
        format.html { redirect_to @author, notice: 'Author was successfully updated.' }
        format.json { render :show, status: :ok, location: @author }
      else
        format.html { render :edit }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /authors/1
  # DELETE /authors/1.json
  def destroy
    @author.destroy
    respond_to do |format|
      format.html { redirect_to authors_url, notice: 'Author was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_author
      @author = Author.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def author_params
      params.require(:author).permit(:name,:authorbooks_attributes => [:id,:book_ids => []])
      
    end

    def get_books
      @all_books = Book.all
      @author_book = @author.authorbooks.build
    end

    # def create_params
    #   params.require(:authorbooks).permit(:author_id,book_id: [])
    # end
end
