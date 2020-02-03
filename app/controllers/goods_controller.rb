# frozen_string_literal: true

class GoodsController < ApplicationController
  before_action :authorize

  def index
    type = params[:type]
    arrival_date = params[:arrival_date]
    goods = type.blank? ? Good.all : Good.all.type(type)
    @goods = arrival_date.blank? ? goods : goods.arrive_by(arrival_date)
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
