class Author < ActiveRecord::Base
#attr_accessor :name
validates :name, :presence => true

has_many :authorbooks
accepts_nested_attributes_for :authorbooks
has_many :books, :through => :authorbooks



end
