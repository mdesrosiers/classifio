class Classified < ActiveRecord::Base
  attr_accessible :title, :description, :image
  validates_presence_of :title, :description

  has_attached_file :image, default_url: 'http://placehold.it/360x268.png', :styles => { :thumbnail => "360x268>" }

  def as_json(options = {})
    super(options.merge(only: [:id, :title, :description], methods: json_methods))
  end

  def thumbnail_url
    image.url(:thumbnail)
  end

  def json_methods
    image.present? ? [:thumbnail_url] : []
  end
end
