class ArticlesController < ApplicationController
  before_action :set_article, only: [:show,:edit,:update,:destroy]
  #before_action :authenticate_user!, only: [:edit,:update,:destroy,:new,:create]
  before_action :authenticate_editor!, only: [:create,:new,:update,:edit]
  before_action :authenticate_admin!, only: [:destroy]
  def index
    @articulos=Article.all
  end
  def show  
  end
  
  def new
    @article=Article.new
    @categories=Category.all
  end
  def create
    if params[:categories].nil?
      redirect_to new_article_path,alert:"Necesitas agregar minimo una categoria."
    else
      @article=current_user.articles.new(article_params)
      @article.categories=params[:categories]
      respond_to do |format|
        if @article.save
          format.html{redirect_to @article , notice: "Articulo #{@article.title} creado"}
          format.json {render :show, status: :created,location: @article}
        else
          format.html{render :new}
          format.json{render json @article.errors,status: :unprocessable_entity}
        end
      end
    end
    
  end
  def edit
  end
  def update
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
    params.require(:article).permit(:title, :body,:categories)
  end
  def set_article
    @article=Article.find(params[:id])
  end
  
  
end