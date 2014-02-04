module RedmineIssueupdate
  class CustomFiledChange < Redmine::Hook::ViewListener

    def controller_issues_edit_after_save(context = { })
      self.update_field(context)
    end


    def update_field(context)
        @issue = context[:issue]
        @journal = context[:journal]
      if @issue.status.name=="Resolved"
          usr_id = "#{@journal.user.id}" rescue '--'
          resolved_cf = CustomField.find_by_name('Resolved By')
          resolved_cv = CustomValue.where(:customized_type => "Issue", :customized_id => @issue.id, :custom_field_id =>  resolved_cf.id).last
          if resolved_cv.present?
             if resolved_cv.value.blank?
                resolved_cv.update_attribute :value, usr_id
             end
          else
             CustomValue.create!(:customized_type => "Issue", :customized_id => @issue.id,:value=>usr_id, :custom_field_id => resolved_cf.id)
          end
      end
      if @issue.status.name=="Reviewed"
         usr_ids = "#{@journal.user.id}" rescue '--'
         resolved_cfs = CustomField.find_by_name('Reviewed By')
         resolved_cvs = CustomValue.where(:customized_type => "Issue", :customized_id => @issue.id, :custom_field_id =>  resolved_cfs.id).last
         if resolved_cvs.present?
            if resolved_cvs.value.blank?
               resolved_cvs.update_attribute :value, usr_ids
            end
       
         else
            CustomValue.create!(:customized_type => "Issue", :customized_id => @issue.id,:value=>usr_id, :custom_field_id => resolved_cfs.id)
         end
      end
 
    end
  end
end

