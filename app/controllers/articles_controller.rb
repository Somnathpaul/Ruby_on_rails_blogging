class ArticlesController < ApplicationController
    # to generate new articles
    def new
       @article = Article.new 
    end

    # to create new articles
    def create
        # to display the values on web after submiting
          # render plain: params[:article].inspect

        # to save the values on databse
        @article = Article.new(article_params)
        @article.save
    end

    private
      def article_params
        params.require(:article).permit(:title, :description)
      end
end