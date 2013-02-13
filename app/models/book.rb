class Book < ActiveRecord::Base
  belongs_to :title
  attr_accessible :volume
end
