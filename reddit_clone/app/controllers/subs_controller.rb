class SubsController < ApplicationController
    def index
        @subs = Sub.all
        render :index
    end

    def show
        # sub#show will also show all posts with the same sub_id
        @sub = @sub.find(params[:id])
        render :show
    end

    def new
        @sub = Sub.new
        render :new
    end

    def create
        @sub = Sub.new(sub_params)
    end

    def edit
        @sub = Sub.find(params[:id])
        render :edit
    end

    def update
        @sub = Sub.find(params[:id])
        
    end

    def destroy
        # need dependent destroy to delete all posts in the sub
        @sub = Sub.find(params[:id])

    end

    private
    def sub_params
        params.require(:sub).permit(:title, :description, :user_id)
    end
end
