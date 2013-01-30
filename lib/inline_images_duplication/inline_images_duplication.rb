require 'inline_images_duplication/images_duplication_patch/images_duplication_helper_patch'

Rails.configuration.to_prepare do
  AttachmentsHelper.send(:include, ImagesDuplicationHelperPatch)
end
