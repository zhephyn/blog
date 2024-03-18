class CommentsController < ApplicationController
    def index
        @post = Post.find(params[:id])
        @comments = @post.comments.find(params[:id])
    end 

    def new
        @post = Post.find(params[:id])
        @comment = @post.comments.build(comment_params)
    end

    def create
        @post = Post.find(params[:id])
        @comment = @post.comments.create(comment_params)
        if @comment.save
            redirect_to post_path(@post)
        else
            render :new
    end
    def destroy
        @post = Post.find(params[:id])
        @comment = @post.comments.find(params[:id])
        if @comment.destroy
            redirect_to posts_path
        end
    end
end
