class ArticlesController < ApplicationController
    # GET: [to generate new articles]
    def new
       @article = Article.new 
    end

    def index
      @article = Article.all
    end

    # POST:  [to create new articles]
    def create
        # to display the values on web after submiting
          # render plain: params[:article].inspect
         
          # to save the values on databse
          @article = Article.new(article_params)
            if @article.save
            # redirect to specific page
              flash[:notice] = "Article was created"
              redirect_to article_path(@article)
             else
              render 'new'
            end
          end

          # GET: [show article after creating]
          def show
            @article = Article.find(params[:id])
          end

          
    private
      def article_params
        params.require(:article).permit(:title, :description)
      end
end