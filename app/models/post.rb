class Post < ActiveRecord::Base
  acts_as_voteable
  acts_as_taggable
  
  belongs_to :user, :counter_cache => true
end
