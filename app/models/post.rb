class Post < ActiveRecord::Base
  validates_presence_of :title
  #paginates_per 5
end
