class ArticlesController < ApplicationController
  http_basic_authenticate_with name: "fuad", password: "12345678",
  except: [:index, :show]
  def index
    @articles = Article.all
  end
  def new
    @article = Article.new
  end
  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "Great! Your post has been created!"
      redirect_to @article
    else
      flash.now[:error] = "Rats! Fix your mistakes, please."
      render :new
    end
  end
  
  def show
    @article = Article.find(params[:id])
    # @articles = Article.all
    # render action: 'index'
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end
