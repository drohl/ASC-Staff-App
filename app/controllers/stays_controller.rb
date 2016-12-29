class StaysController < ApplicationController
  before_action :set_stay, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @stays = Stay.all.order("created_at DESC")
  end

  def show
  end

  def new
    @stay = current_user.stays.build #Stay.new
  end

  def edit
  end

  def create
    @stay = current_user.stays.build(stay_params)#Stay.new(stay_params)

      if @stay.save
        redirect_to stays_url, notice: "You're on the list."
      else
        render :new
      end
  end

  def update
      if @stay.update(stay_params)
        redirect_to stays_url, notice: 'Note updated. Thanks!'
      else
        render :edit
      end
  end

  def destroy
    @stay.destroy
      redirect_to stays_url, notice: "Your name is off the list. Thanks!"
  end

  private
    def set_stay
      @stay = Stay.find(params[:id])
    end

    def correct_user
      @stay = current_user.stays.find_by(id: params[:id])
      redirect_to stays_path, notice: "You're not allowed to edit this." if @stay.nil?
    end

    def stay_params
      params.require(:stay).permit(:note)
    end
end
