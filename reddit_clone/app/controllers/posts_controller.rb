class PostsController < ApplicationController

    # not used - for practice only - posts shown in sub#show
    # def index
    #     @posts = Post.all
    #     render :index
    # end

    def show
        @post = Post.find(params[:id])
        render :show
    end

    def new
        @post = Post.new
        render :new
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            # redirect to ?
        else
            # flash error
            # render/redirect
        end
    end

    def edit
        @post = Post.find(params[:id])
        render :edit
    end

    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
            # redirect?
        else
            # flash error
            # redirect/render
        end
    end

    def destroy
        @post = Post.find(params[:id])
        if @post.destroy
            # redirect
        else
            # flash error
            # redirect/render
        end
    end

    private
    def post_params
        params.require(:post).require(:title, :url, :content, :sub_id, :author_id)
    end
end
