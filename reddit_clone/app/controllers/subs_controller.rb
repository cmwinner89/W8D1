class SubsController < ApplicationController
    # before_action :require_logged_in

    def new
        @sub = Sub.new
        render :new
    end

    def create
        @sub = current_user.subs.new(sub_params)

        if @sub.save
            redirect_to sub_url(@sub)
        else
            flash.now[:errors] = @sub.errors.full_messages
            render :new
        end
    end

    def edit
        @sub = Sub.find(params[:id])
        render :edit
    end

    def update
        @sub = Sub.find(params[:id])

        if @sub.update_attributes(sub_params)
            redirect_to sub_url(@sub)
        else
            flash.now[:errors] = @sub.errors.full_messages
            render :edit
        end
    end

    def show
        @sub = Sub.find(params[:id])
        render :show
    end

    def index
        @subs = Sub.all
        render :index
    end

    def destroy
        @sub = Sub.find(params[:id])
    end

    private

    def sub_params
        params.require(:sub).permit(:title, :description)
    end
end