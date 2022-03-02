class Api::V1::ArticlesController < ApplicationController
  before_action :set_api_v1_article, only: %i[ show update destroy ]


  def index
    @api_v1_articles = Api::V1::Article.all
    render json: @api_v1_articles
  end

  def show
    @api_v1_article = Api::V1::Article.find(params[:id])
    render json: @api_v1_article
  end

  def create
    @api_v1_article = Api::V1::Article.new(title: params[:title],description: params[:description])

    if @api_v1_article.save
      result = { type: 'Success', data: ActiveModelSerializers::SerializableResource.new(@api_v1_article, each_serializer: Api::V1::ArticleSerializer), message: ["user created successfully"],
    status: 200}
      render json: result
    else
      render json: @api_v1_article.errors, status: :unprocessable_entity
    end
  end

  def update
    @api_v1_article = Api::V1::Article.find(params[:id])
    if @api_v1_article.update(title: params[:title],description: params[:description])
      render json: "Successfully updated"
    else
      render json: @api_v1_article.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @api_v1_article.destroy
    render json: "Successfully deleted"
  end

  private
  
    def set_api_v1_article
      @api_v1_article = Api::V1::Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_article_params
      params.fetch(:api_v1_article, {title:"power of mind",description:"our mind is so powerful"})
    end
end
