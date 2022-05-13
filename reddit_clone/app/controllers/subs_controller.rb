class SubsController < ApplicationController
    before_action :sub_admin, only: [:edit, :create, :destroy]

    def index
        @subs = Sub.all
        render :index
    end

    def show
        # sub#show will also show all posts with the same sub_id
        @sub = @sub.find_by(id: params[:id])
        render :show
    end

    def new
        # @sub = Sub.new
        render :new
    end

    def create
        @sub = Sub.new(sub_params)
        if @sub.save
            redirect_to sub_url(@sub)
        else
            flash.now[:errors] = @sub.errors.full_messages
            render :new
        end
    end

    def edit
        @sub = Sub.find_by(id: params[:id])
        render :edit
    end

    def update
        @sub = Sub.find_by(id: params[:id])

        if @sub.update(sub_params)
            redirect_to sub_url(@sub)
        else
            flash.now[:errors] = @sub.errors.full_messages
            render :edit
            # flash[:errors] = @sub.errors.full_messages
            # redirect_to edit_sub_url(@sub)
        end
    end

    def destroy
        @sub = Sub.find_by(id: params[:id])
        if @sub && @sub.destroy
            redirect_to subs_url
        end
    end

    private
    def sub_params
        params.require(:sub).permit(:title, :description, :user_id)
    end

    # verify permisisons for user to edit
    def sub_admin
        unless logged_in? && @sub.user_id == current_user.id
            flash.now[:errors] = ["Only the sub moderator can modify or delete the sub."]
        end
    end
end
