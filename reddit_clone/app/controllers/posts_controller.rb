class PostsController < ApplicationController

    def new
        @post = Post.new
        render :new
    end

    def create
        @post = current_user.posts.new(post_params)

        if @post.save
            redirect_to post_url(@post)
        else
            flash.now[:errors] = @post.errors.full_messages
            render :new
        end
    end

    def edit
        @post = Post.find(params[:id])
        render :edit
    end

    def update
        @post = Post.find(params[:id])

        if @post.update_attributes(post_params)
            redirect_to post_url(@post)
        else
            render :edit
        end
    end

    def show
        @post = Post.find(params[:id])
    end

    def destroy
        @post = Post.find(params[:id])

        if @post.delete
            redirect_to subs_url
        end
    end

    private

    def post_params
        params.require(:post).permit(:title, :url, :content)
    end
end