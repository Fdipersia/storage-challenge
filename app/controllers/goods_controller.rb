# frozen_string_literal: true

class GoodsController < ApplicationController
  def index
    @goods = Good.all
  end

  def new
    @good = Good.new
  end

  def create
    @good = Good.new(good_params)
    if @good.save
      redirect_to goods_path
      flash.notice = 'Good successfully created'
    else
      redirect_to new_good_path
      flash.notice = 'Good could not be created'
    end
  end

  private

  def good_params
    params.require(:good).permit(:name, :category, :source, :destination, :entry_at, :exit_at)
  end
end
