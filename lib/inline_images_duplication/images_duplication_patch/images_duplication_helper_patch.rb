module ImagesDuplicationHelperPatch
  def self.included(base)
    base.class_eval do

      def link_to_attachments(container, options = {})
        options.assert_valid_keys(:author, :thumbnails)
        if container.attachments.any?
          #=====patch begin======
          comments_attachments = Array.new

          if Setting.plugin_redmine_inline_note_images_plugin['hide_comments_images']

            container.journals.each do |journal|
              journal.details.where(property: 'attachment').each do |a|
                comments_attachments.push Attachment.find_by_id a.prop_key
              end
            end
          end
          #=======patch end=======
          options = {:deletable => container.attachments_deletable?, :author => true}.merge(options)
          render :partial => 'attachments/links',
            :locals => {:attachments => container.attachments - comments_attachments, :options => options, :thumbnails => (options[:thumbnails] && Setting.thumbnails_enabled?)}
        end
      end
    end
  end

end
