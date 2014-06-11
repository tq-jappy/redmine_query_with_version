module QueryWithVersion
  module Hooks
    class ViewIssuesHook < Redmine::Hook::ViewListener
      render_on :view_issues_sidebar_queries_bottom, :partial => 'query_with_version/issues_sidebar_queries'
    end
  end
end
