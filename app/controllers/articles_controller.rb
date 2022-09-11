class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, except: [:index, :show]
  
  def index
    @articles = Article.order("created_at DESC")
  end
  
  def show
  end
  
  def new
    @article = Article.new
  end
  
  def edit
  end
  
  def create
    Article.create(article_params)
    redirect_to root_path
  end
  
  def update
    @article.update(article_params)
    redirect_to root_path
  end
  
  def destroy
    @article.destroy
    redirect_to root_path
  end
  
  private
  
  def find_article
    @article = Article.find(params[:id])
  end
  
  def article_params
    params.require(:article).permit(:text).merge(user_id: current_user.id)
  end
  
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
