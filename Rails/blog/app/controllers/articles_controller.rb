class ArticlesController < ApplicationController
  before_action :set_article, only: [:show,:edit,:update,:destroy]
  before_action :imprimir, except: [:show,:update,:destroy]
  
  def index
    @articulos=Article.all
  end
  def show  
  end
  
  def new
    @article=Article.new
  end
  def create
    @article=Article.new(article_params)
    respond_to do |format|
      if @article.save
        format.html{redirect_to @article , notice: "Articulo #{@article.title} creado"}
        format.json {render :show, status: :created,location: @article}
      else
        format.html{redirect_to :new}
        format.json{render json @article.errors,status: :unprocessable_entity}
        
      end
      
    end
  end
  def edit
    
  end
  def update
    render :edit
    respond_to do |format|
    if @article.update(article_params)
      format.html{redirect_to @article , notice: "Articulo #{@article.title} actualizado"}
      format.json {render :show, status: :ok,location: @article}    
    else
      format.html{redirect_to :edit}
      format.json{render json @article.errors,status: :unprocessable_entity}
        
    end
  end
  end
  def destroy
    @article.destroy
    respond_to do |format|
    format.html{redirect_to articles_url , notice: "Articulo eliminado"}
    format.json {head :no_contents}    
  end
  end
  
  private
  def article_params
    params.require(:article).permit(:title, :body)
  end
  def set_article
    @article=Article.find(params[:id])
  end
  
  def imprimir
    puts params.to_yaml
  end
end