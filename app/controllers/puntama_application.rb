class PuntamaApplication < Sinatra::Base
  use Rack::Session::Cookie, secret: "IdoNotHaveAnySecret"
  register Sinatra::Flash
  include Locale

  set :public_folder, Proc.new { File.join(Puntama.root, 'public') }
  set :views, Puntama.views_path
  set :bind, '0.0.0.0'

  def render_haml(template_name)
    haml template_name.to_sym, layout: '/layouts/application'.to_sym
  end

  def partial_haml(template_name)
    haml template_name.to_sym, layout: false
  end
end
