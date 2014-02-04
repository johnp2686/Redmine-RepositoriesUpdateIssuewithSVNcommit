module RedmineIssueupdate
  class IssuesUpdate < Redmine::Hook::ViewListener

    def model_changeset_scan_commit_for_issue_ids_pre_issue_update(context)
      @issue = context[:issue]
      @journal = @issue.current_journal
      @changeset = context[:changeset]
    
      resolved_cf = CustomField.find_by_name('Resolved By')
      resolutiontype_cf = CustomField.find_by_name('Resolution Type')

      resolved_cv = CustomValue.where(:customized_type => "Issue", :customized_id => @issue.id, :custom_field_id => resolved_cf.id).last
      resolutiontype_cv= CustomValue.where(:customized_type => "Issue", :customized_id => @issue.id, :custom_field_id => resolutiontype_cf.id).last
      if resolved_cv.present? 
        resolved_cv.update_attribute :value, @changeset.user_id
      else
        CustomValue.create!(:customized_type => "Issue", :customized_id => @issue.id, :value =>@changeset.user_id, :custom_field_id => resolved_cf.id)
      end 

      if resolutiontype_cv.present?
        resolutiontype_cv.update_attribute :value,"FIXED"
      else
        CustomValue.create!(:customized_type => "Issue", :customized_id => @issue.id, :value =>"FIXED", :custom_field_id => resolutiontype_cf.id)
      end 
    end
  end
end
