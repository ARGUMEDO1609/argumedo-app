
class Admin::ProductsController < AdminController
  before_action :set_admin_product, only: %i[ show edit update destroy ]

  def index
    @admin_products = Product.all
  end

  def show
  end

  def new
    @admin_product = Product.new
  end

  def edit
  end

  # POST /admin/products or /admin/products.json
  def create
    @admin_product = Product.new(product_params)

    respond_to do |format|
      if @admin_product.save
        format.html { redirect_to admin_product_url(@admin_product), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @admin_product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/products/1 or /admin/products/1.json
  def update
   @admin_product = Product.find(params[:id])
    if @admin_product.update(product_params.reject { |k| k["images"] })
      if product_params[:images]
        product_params[:images].each do |image|
          @admin_product.images.attach(image)
        end
      end
            redirect_to admin_product_url(@admin_product), notice: "Product was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /admin/products/1 or /admin/products/1.json
  def destroy
    @admin_product.destroy!

    respond_to do |format|
      format.html { redirect_to admin_products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_product
      @admin_product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :description, :price, :category_id, images: [])
    end
end
