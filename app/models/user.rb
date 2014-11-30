class User < ActiveRecord::Base
  def authenticated?(password)
    self.password == password
  end
end
