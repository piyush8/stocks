class OrderController < ApplicationController
   skip_before_action :verify_authenticity_token

  def method_name
    if params[:stock].present?
      if params[:bearer].present?
        if params[:currency].present?
          if params[:value_cents].present?
            a = Stock.find_by_name(params[:stock])
            b = Bearer.find_by_name(params[:bearer])
            c = MarketPrice.find_by_currency(params[:currency])
            d = MarketPrice.find_by_value_cents(params[:value_cents])
            if a.present? && b.present? && c.present? && d.present?
              order = StockList.new
              order.stock = params[:stock]
              order.bearer = params[:bearer]
              order.currency = params[:currency]
              order.value_cents = params[:value_cents].to_i

              order.save!
              render json: {"status":"success", "Message":"Stock Order created"}, status: 200
            else
              render json: {"status":"error", "Message":"something went wrong, please try again with new values..."}, status: 400
            end
          else
            render json: {"status":"error", "Message":"value_cents not available"}, status: 400
          end
        else
          render json: {"status":"error", "Message":"currency not available"}, status: 400
        end
      else
        render json: {"status":"error", "Message":"enter bearer"}, status: 400
      end
    else
      render json: {"status":"error", "Message":"Enter Stock"}, status: 400
    end
  end

  def index
    a = StockList.all
    if a.present?
      render json: {"status":"success", "Orders": a}, status:200
    else
      render json: {"status":"success", "message": "no Orders created"}, status:204
    end
  end

  def delete
    if params[:stock].present? && params[:bearer].present? && params[:currency].present? && params[:value_cents].present?
      a = StockList.find_by_stock(params[:stock]) and  StockList.find_by_bearer(params[:bearer]) and  StockList.find_by_currency(params[:currency]) and  StockList.find_by_value_cents(params[:value_cents])
      StockList.delete(a.id)
      render json: {"status":"success", "deleted successfully": a}, status:200
    else
      render json: {"status":"success", "record not found": a}, status:404
    end
  end

  def update
    if params[:stock].present?
      if params[:bearer].present?
        if params[:currency].present?
          if params[:value_cents].present?
            a = Stock.find_by_name(params[:stock])
            b = Bearer.find_by_name(params[:bearer])
            c = MarketPrice.find_by_currency(params[:currency])
            d = MarketPrice.find_by_value_cents(params[:value_cents])
            if a.present? && b.present? && c.present? && d.present?
              order = StockList.find_by_stock(params[:stock]) and  StockList.find_by_bearer(params[:bearer]) and  StockList.find_by_currency(params[:currency]) and  StockList.find_by_value_cents(params[:value_cents])
              order.stock = params[:stock]
              order.bearer = params[:bearer]
              order.currency = params[:currency]
              order.value_cents = params[:value_cents].to_i

              order.save!
              render json: {"status":"success", "Message":"Stock Order created"}, status: 200
            else
              render json: {"status":"error", "Message":"something went wrong, please try again with new values..."}, status: 400
            end
          else
            render json: {"status":"error", "Message":"value_cents not available"}, status: 400
          end
        else
          render json: {"status":"error", "Message":"currency not available"}, status: 400
        end
      else
        render json: {"status":"error", "Message":"enter bearer"}, status: 400
      end
    else
      render json: {"status":"error", "Message":"Enter Stock"}, status: 400
    end
  end
end
