class CommentsController < ApplicationController
    def index
        @post = Post.find(params[:post_id])
        @comments = @post.comments
    end 

    def new
        @post = Post.find(params[:post_id])
        @comment = @post.comments.build(comment_params)
    end

    def show
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
    end
    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(comment_params)
        if @comment.save
            redirect_to post_path(@post)
        else
            render :new
        end
    end
    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        if @comment.destroy
            redirect_to post_path(@post)
        end
    end

    private
    def comment_params
        params.require(:comment).permit(:body)
    end

end
