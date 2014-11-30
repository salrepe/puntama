module Puntama
  def self.dispatcher
    Puntama::Dispatcher.new
  end

  class Dispatcher
    def call(env)
      path_info = env['PATH_INFO']

      app = case path_info
        when %r{^/auth} then AuthController.new
        when %r{^/admin/categories} then Admin::CategoriesController.new
        when %r{^/admin/products} then Admin::ProductsController.new
        when %r{^/admin} then Admin::AdminController.new
        else
          PuntamaApplication.new
        end

      app.call(env)
    end
  end
end
