# frozen_string_literal: true

class GoodsController < ApplicationController
  before_action :authorize

  def index
    @goods = Good.all
  end

  def new
    @good = Good.new
  end

  def create
    @good = Good.new(good_params)
    if @good.save
      flash.notice = 'Good successfully created'
      redirect_to goods_path
    else
      render 'new'
    end
  end

  private

  def good_params
    params.require(:good).permit(:name, :category, :source, :destination, :entry_at, :exit_at)
  end
end
