class SnippetsController < ApplicationController
  before_action :set_snippet, only: [:show, :update, :destroy]


  def index
    render json: Snippet.all()
  end

  # GET /snippets/1
  def show
    render json: @snippet
  end

  # POST /snippets/search
  def search
    @query = params.fetch(:query)

    #TODO: search labels and src of the snippets table
    if @query.present?
      @result = Snippet.where('code LIKE ?','%'+@query+'%').first(5);
      render json: @result
    else
      render json: "Query is empty",status: :bad_request
    end
  end

  # POST /snippets
  def create
    @snippet = Snippet.new(snippet_params)

    if @snippet.save
      render json: @snippet, status: :created, location: @snippet
    else
      render json: @snippet.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /snippets/1
  def update
    if @snippet.update(snippet_params)
      render json: @snippet
    else
      render json: @snippet.errors, status: :unprocessable_entity
    end
  end

  # DELETE /snippets/1
  def destroy
    @snippet.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_snippet
      @snippet = Snippet.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def snippet_params
      params.fetch(:snippet, {}).permit(:name, :code)
    end
end
