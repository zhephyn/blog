class PostsController < ApplicationController
    def index
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])
        @comment = Comment.new
    end

    def edit
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to post_path(@post)
         else
            render "new", format: :html
         end
    end

    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
            redirect_to post_path(@post)
        else
            render :edit
        end
    end

    def destroy
        @post = Post.find(params[:id])
        if @post.destroy
            redirect_to posts_path, alert:  "You successfully deleted the Post"
        end
    end

    private
    def post_params
        params.require(:post).permit(:title, :body, :image, :category_id)
    end
end
