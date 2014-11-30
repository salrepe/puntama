module Admin
  class CategoriesController < AdminController
    def self.path(subpath='')
      "/admin/categories#{subpath}"
    end

    def path(subpath='')
      self.class.path(subpath)
    end

    get path do
      @categories = Category.all
      render_haml path('/index')
    end

    get path('/new') do
      render_haml path('/new')
    end

    post path('/create') do
      category = Category.new(name: params[:category][:name])
      if category.save
        flash[:success] = 'New category added successfully'
        redirect path
      else
        render_haml path('/new')
      end
    end

    get path('/:category_id/edit') do
      @category = Category.find(params[:category_id])
      render_haml path('/edit')
    end

    post path('/:category_id/update') do
      @category = Category.find(params[:category_id])
      if @category.update_attributes(params[:category])
        flash[:success] = 'Category was updated successfully'
        redirect path
      else
        render_haml path('/edit')
      end
    end
  end
end
