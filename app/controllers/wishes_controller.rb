class WishesController < ApplicationController
  before_action :set_wish, only: %i[show update destroy]
  before_action :validate_user

  # GET /wishes
  def index
    @wishes = current_user.wishes.all

    render json: @wishes
  end

  # GET /wishes/1
  def show
    render json: @wish
  end

  # POST /wishes
  def create
    # require 'pry'
    # binding.pry
    @wish = current_user.wishes.build(wish_params)
      @wish.valid?
    if @wish.save
      render json: @wish, status: :created, location: @wish
    else
      render json: @wish.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /wishes/1
  def update
    if @wish.update(wish_params)
      render json: @wish
    else
      render json: @wish.errors, status: :unprocessable_entity
    end
  end

  # DELETE /wishes/1
  def destroy
    @wish.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wish
      # @wish = Wish.find(params[:id])
      validate_user
      @wish = current_user.wishes.find(params[:id])
    end

    def validate_user
      set_current_user
    end

    # Only allow a trusted parameter "white list" through.
    def wish_params
      params.require(:wish).permit(:goal)
    end
end
