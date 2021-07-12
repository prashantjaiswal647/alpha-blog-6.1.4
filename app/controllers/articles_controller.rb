class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :description)) # This makes an article by requiring the inputs with params, but only permitting :title and :description hash keys to come through, as a security feature. It used to be params[:article]
    # render plain: @article.inspect # To see the creation for testing purposes
    if @article.save
      flash[:notice] = "Article was created successfully." # There are two types of flash, notice and alert. Alert is usually for when something goes wrong. This is to show that the article was successfully created.
      redirect_to @article # Below is longhand, this is shorthand since this is so commonly used.
      # redirect_to article_path(@article) # use rails routes --expanded in console, go up to the show action, then see that the prefix is 'article', meaning article_path, and that it needs the ID, so we give @article which Rails knows to get the ID of the article given, then to redirect_to it and show that view.
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = "Article was updated successfully."
      redirect_to @article # Send to the article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path # Send to the 'index' table of Articles
  end

end