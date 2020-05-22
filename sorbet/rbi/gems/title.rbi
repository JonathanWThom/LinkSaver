# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: strong
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/title/all/title.rbi
#
# title-0.0.7
module Title
end
class Title::Engine < Rails::Engine
end
module Title::TitleHelper
  def title(additional_context = nil); end
end
class Title::TitleHelper::PageTitle
  def action_name; end
  def adjusted_action_name(action_name); end
  def application_title; end
  def context; end
  def controller_name; end
  def controller_path; end
  def default_keys_in_lookup_path; end
  def defaults; end
  def guess_title; end
  def initialize(controller_path, action_name, context); end
  def to_s; end
end