require 'inline_images_duplication/images_duplication_patch/comment_images_delete_link_helper_patch'

Rails.configuration.to_prepare do
  IssuesHelper.send(:include, CommentImagesDeleteLinkHelperPatch)
end
