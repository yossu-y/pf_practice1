class User::ArticlesController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]
  
  def index
    @articles = Article.all
  end
  
  def new
    @article = Article.new
  end
  
  def show
  end
  
  def create
   @article = current_user.articles.new(article_params)
    if @article.save
      redirect_to article_path(@article)
    else
      @articles = Article.all
      render "index"
    end
  end
  
  def edit
  end

  def update
  end

  def destroy
  end

  private

  def article_params
    params.require(:article).permit(:image, :title, :body)
  end

  def ensure_correct_user
    @article = Article.find(params[:id])
    @user = @article.user
    redirect_to(articles_path) unless @user == current_user
  end
  
end


