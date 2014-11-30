module Admin
  class AdminController < PuntamaApplication

    def self.path(subpath='')
      "/admin#{subpath}"
    end

    def path(subpath='')
      self.class.path(subpath)
    end

    get path do
      render_haml path('/index')
    end
  end
end
