class Pin < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image, :styles => { :large => "500x500>", :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]
end
