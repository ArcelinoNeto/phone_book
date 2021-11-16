class UsersController < ApplicationController
  before_action :authenticate_user!
    before_action :set_users, only: [:edit, :update, :show, :destroy]

  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = current_user.new(params_contact)
    if @user.save
      redirect_to user_path, notice: "O usuário (#{@user.name} #{@user.email}) foi salvo com sucesso!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(params_user)
      redirect_to user_path, notice: "O usuário (#{@user.name} #{@user.email}) foi alterado com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      redirect_to user_path, notice: "O usuário (#{@user.name} #{@user.email}) foi apagado com sucesso!"
    else
      render :destroy
    end
  end

  private

    def params_user
      params.require(:user).permit(:name, :email)
    end

    def set_user
      @user = User.find(params[:id])
    end
end
