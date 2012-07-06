class Classified < ActiveRecord::Base
  attr_accessible :title, :description, :image
  validates_presence_of :title, :description

  has_attached_file :image, default_url: 'http://placehold.it/360x268'

  def as_json(options = {})
    super(options.merge(only: [:id, :title, :description], methods: :image_url))
  end

  def image_url
    image.url
  end
end
