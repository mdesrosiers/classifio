class Classified < ActiveRecord::Base
  attr_accessible :title, :description
  validates_presence_of :title, :description

  def as_json(options = {})
    super(options.merge(only: [:id, :title, :description]))
  end
end
