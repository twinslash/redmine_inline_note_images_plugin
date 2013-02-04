require_dependency 'inline_image_hook/hooks'
require 'inline_images_duplication/inline_images_duplication'

Redmine::Plugin.register :redmine_inline_note_images_plugin do
  name 'Redmine Inline Note Images plugin'
  author 'AnjLab'
  description 'Inline note images for Redmine issues'
  version '0.0.1'
  url 'https://github.com/anjlab/redmine_inline_note_images_plugin'
  author_url 'http://anjlab.com'

  settings :default => {'hide_comments_images' => false}, :partial => 'settings/comment_images'
end
