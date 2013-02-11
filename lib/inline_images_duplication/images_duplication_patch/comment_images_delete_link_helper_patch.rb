module CommentImagesDeleteLinkHelperPatch
  def self.included(base)
    base.send(:include, InstanceMethods)

    base.class_eval do
      alias_method_chain :show_detail , :delete_link
    end
  end

  module InstanceMethods
    def show_detail_with_delete_link(detail, no_html=false, options={})
      value = show_detail_without_delete_link(detail, no_html, options)

      if id = value.match(/\/attachments\/download\/(\d+)\//)
        atta = Attachment.find(id[1])
        if atta.author == User.current
          value += link_to image_tag('delete.png'), attachment_path(atta),
                           :data => {:confirm => l(:text_are_you_sure)},
                           :method => :delete,
                           :class => 'delete',
                           :title => l(:button_delete)
        end
      end
      value
    end
  end

end
