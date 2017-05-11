class AuthorbooksController < ApplicationController
  before_action :set_authorbook, only: [:show, :edit, :update, :destroy]

  # GET /authorbooks
  # GET /authorbooks.json
  def index
    @authorbooks = Authorbook.all
  end

  # GET /authorbooks/1
  # GET /authorbooks/1.json
  def show
  end

  # GET /authorbooks/new
  def new
    @authorbook = Authorbook.new
  end

  # GET /authorbooks/1/edit
  def edit
  end

  # POST /authorbooks
  # POST /authorbooks.json
  def create
    @authorbook = Authorbook.new(authorbook_params)

    respond_to do |format|
      if @authorbook.save
        format.html { redirect_to @authorbook, notice: 'Authorbook was successfully created.' }
        format.json { render :show, status: :created, location: @authorbook }
      else
        format.html { render :new }
        format.json { render json: @authorbook.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /authorbooks/1
  # PATCH/PUT /authorbooks/1.json
  def update
    respond_to do |format|
      if @authorbook.update(authorbook_params)
        format.html { redirect_to @authorbook, notice: 'Authorbook was successfully updated.' }
        format.json { render :show, status: :ok, location: @authorbook }
      else
        format.html { render :edit }
        format.json { render json: @authorbook.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /authorbooks/1
  # DELETE /authorbooks/1.json
  def destroy
    @authorbook.destroy
    respond_to do |format|
      format.html { redirect_to authorbooks_url, notice: 'Authorbook was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_authorbook
      @authorbook = Authorbook.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def authorbook_params
      params.require(:authorbook).permit(:author_id, :book_id)
    end
end
