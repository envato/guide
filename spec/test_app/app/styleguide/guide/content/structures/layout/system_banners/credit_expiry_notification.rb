class Guide::Content::Structures::Layout::SystemBanners::CreditExpiryNotification < Guide::Component
  def template
    'temp/component'
  end

  def layout_css_classes
    {
      :parent => '',
      :scenario => ''
    }
  end

  def stylesheets
    ['application/core.css', 'application/default.css']
  end

  def javascripts
    ['application/core.css', 'application/default.css']
  end

  def view_model
    Guide::ViewModel.new
  end

  private

  scenario :default do
    view_model
  end
end