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

  def massive_import; end

  def import
    processed_goods = Good.import(params[:file])
    render 'processed_goods', locals: { processed_goods: processed_goods }
  end

  private

  def good_params
    params.require(:good).permit(:name,
                                 :category,
                                 :consignment_id,
                                 :source,
                                 :destination,
                                 :entry_at,
                                 :exit_at)
  end
end
