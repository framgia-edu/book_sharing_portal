class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :set_categories
  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def set_categories
    @categories = Category.all
  end

  def search search
    if search.blank?
      Book.updated_desc.paginate page: params[:page], per_page: 12
    else
      Book.where("name ILIKE ?",
        "%#{search}%").updated_desc.paginate page: params[:page],
          per_page: 12
    end
  end
end
