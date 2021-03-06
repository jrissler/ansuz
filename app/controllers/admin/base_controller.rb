class Admin::BaseController < ApplicationController
  layout 'admin'

  before_filter :login_required
  before_filter :load_admin_plugin_nav

  permit 'admin or initial_reviewer or final_reviewer or author'

  protected
  def load_admin_plugin_nav
    # The plugin nav comes across as an array of arrays like [text, url]
    @admin_plugin_nav = Ansuz::PluginManagerInstance.admin_plugin_nav
  end
end
