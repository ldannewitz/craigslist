class Article < ActiveRecord::Base
  belongs_to :category
  validates :title, :description, :location, :email, presence: true
  validates :title, length: { minimum: 3 }
  validates :description, length: { minimum: 10 }

  def previous
    self.category.articles.where("id < ?", self.id).last
  end

  def next
    self.category.articles.where("id > ?", self.id).first
  end

  def first?
    self.category.articles.first.id == self.id
  end

  def last?
    self.category.articles.last.id == self.id
  end

end
