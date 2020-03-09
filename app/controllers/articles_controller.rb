class ArticlesController < ApplicationController

  def index
    @article = Article.all
  end

    # GET: [to generate new articles]
    def new
       @article = Article.new 
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

          # PUT : [edit]
          def edit
            @article = Article.find(params[:id])
          end
          
          # Edit is handel by the update action
          def update
            @article = Article.find(params[:id])
            if @article.update(article_params)
              # flash message if article gets update
              flash[:notice] = "Article was updated"
              redirect_to article_path(@article)
            else
              render 'edit'
           end
          end

          
    private
      def article_params
        params.require(:article).permit(:title, :description)
      end
end