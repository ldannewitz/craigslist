class Article < ActiveRecord::Base
  belongs_to :category
  validates :title, :description, :location, :email, presence: true
  validates :title, length: { minimum: 3 }
  validates :description, length: { minimum: 10 }

  after_initialize :assign_key

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

  private
  def assign_key
    self.key ||= generate_key
  end

  def generate_key
    %w(a b c 1 2 e 4 3 2 g 4 2 9 8 4 3 f d c m 1).sample(5).join("")
  end

end
