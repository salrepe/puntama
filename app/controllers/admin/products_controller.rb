module Admin
  class ProductsController < AdminController
    def self.path(subpath)
      "/admin/products/#{subpath}"
    end

    def path(subpath)
      self.class.path(subpath)
    end

    get path('index') do
      @products = Product.all
      render_haml path('index')
    end

    get path('new') do
      @categories = Category.all
      render_haml path('new')
    end

    post path('create') do
      product = Product.new(params[:product])
      if product.save
        redirect path('index')
      else
        render_haml path('new')
      end
    end

    get path(':product_id/edit') do
      @product = Product.find(params[:product_id])
      @categories = Category.all
      render_haml path('edit')
    end

    post path(':product_id/update') do
      @product = Product.find(params[:product_id])
      if @product.update_attributes(params[:product])
        redirect path('index')
      else
        render_haml path('edit')
      end
    end
  end
end
