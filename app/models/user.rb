class User < ActiveRecord::Base
  acts_as_authentic do |c|
  end # block optional
  
  def before_save
    if self.name.blank?
      self.name = self.login
    end
  end
  
  acts_as_voter
  
  has_many :posts
  
  # ========== methods ===================
end
