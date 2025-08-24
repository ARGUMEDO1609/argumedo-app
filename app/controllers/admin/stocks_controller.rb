class Admin::StocksController < AdminController
  before_action :set_stock, only: %i[ show edit update destroy ]

  def index
    @admin_stocks = Stock.all
  end


  def show
  end

  def new
    @admin_stock = Stock.new
  end

  def edit
  end

  def create
    @admin_stock = Stock.new(stock_params)

    respond_to do |format|
      if @admin_stock.save
        format.html { redirect_to @admin_stock, notice: "Stock was successfully created." }
        format.json { render :show, status: :created, location: @admin_stock }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @admin_stock.update(stock_params)
        format.html { redirect_to @admin_stock, notice: "Stock was successfully updated." }
        format.json { render :show, status: :ok, location: @admin_stock }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @admin_stock.destroy!

    respond_to do |format|
      format.html { redirect_to admin_stocks_path, status: :see_other, notice: "Stock was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_stock
      @admin_stock = Stock.find(params[:id])
    end

    def stock_params
      params.require(:stock).permit(:product_id, :amount, :size)
    end
end
