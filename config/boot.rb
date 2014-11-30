require 'bundler'

load_paths = [
    File.join(File.dirname(__FILE__), '..', 'lib'),
    File.join(File.dirname(__FILE__), '..', 'app'),
    File.join(File.dirname(__FILE__), '..', 'config')
]
load_paths.each do |lp|
    $LOAD_PATH.unshift(lp) if File.exists?(lp)
end

require 'puntama'
require 'dispatcher'

require 'rubygems'
require 'sinatra'
require 'haml'
require 'pg'
require 'sinatra/activerecord'
require 'sinatra/flash'
require 'i18n'
require 'i18n/backend/fallbacks'

require 'locale'

require 'initializers/active_record_connection'
require 'initializers/warden'

require 'controllers/puntama_application'
require 'controllers/auth_controller'
require 'controllers/admin/admin_controller'
require 'controllers/admin/categories_controller'
require 'controllers/admin/products_controller'

require 'models/category'
require 'models/product'
require 'models/user'

Bundler.require(:default, Puntama.env.to_sym)
