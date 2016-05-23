module PathHelper
  def cat_path
    '/' + Category.find(params[:category_id]).name
  end
end
