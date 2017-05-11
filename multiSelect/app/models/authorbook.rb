class Authorbook < ActiveRecord::Base

#attr_accessor :author_id, :book_id
belongs_to :book
belongs_to :author

end
