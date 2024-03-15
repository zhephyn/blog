class PostsController < ApplicationController
    def index
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])
    end

    def edit
        ## Read more about the line below
        render :edit
    end
    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            render @post
         else
            render :new
         end
        ##add an if else statement to check if the created post is saved and redirect to post or when its 
        ##not saved and render the form again
    end

    def update
        @post = Post.find(params[:id])
        @post.update
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
    end

    private
    def post_params
        params.require(:post).permit(:title, :body)
    end
end
