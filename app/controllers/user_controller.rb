class UserController < ApplicationController
    before_action :authenticate_user!
    load_and_authorize_resource
    def index
        # @users = User.all
        @q = User.ransack(params[:q])
        @users = @q.result(distinct: true).paginate(page: params[:page], per_page: 10)
    end

    def show
        # raise params[:user_id].to_yaml
        @user = User.find(params[:user_id])
    end
end
