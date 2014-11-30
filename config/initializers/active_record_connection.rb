db_config = YAML::load(File.open(File.join(File.dirname(__FILE__), '../database.yml')))[Puntama.env]
ActiveRecord::Base.establish_connection(db_config)
