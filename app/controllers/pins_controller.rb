class PinsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_action :set_pin, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    # With pagination from will_paginate gem
    @pins = Pin.order("created_at DESC").page(params[:page]).per_page(20)
    respond_to do |format|
      format.html # index.html.erb
      #format.json { render json: @pins }
      format.js
    end
  end

  def show
    @pin = Pin.find(params[:id])
  end

  def new
    @pin = current_user.pins.build
  end

  def edit
    @pin = current_user.pins.find(params[:id])
  end

  def create
    @pin = current_user.pins.build(params[:pin])
      if @pin.save
        redirect_to @pin, notice: 'Pin was successfully created.'
      else
        render action: 'new'  
      end
  end

  def update
    @pin = current_user.pins.find(params[:id])
      if @pin.update_attributes(params[:pin])
        redirect_to @pin, notice: 'Pin was successfully updated.'
      else
        render action: 'edit'
      end
  end

  def destroy
    @pin = current_user.pins.find(params[:id])
    @pin.destroy
      redirect_to pins_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pin
      @pin = Pin.find(params[:id])
    end

    def correct_user
      @pin = current_user.pins.find_by(id: params[:id])
      redirect_to pins_path, notice: "Not authorized to edit this pin" if @pin.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pin_params
      params.require(:pin).permit(:description, :image)
    end
end
