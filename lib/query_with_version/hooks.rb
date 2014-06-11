module QueryWithVersion
  module Hooks
    class ViewIssuesHook < Redmine::Hook::ViewListener
      def view_issues_sidebar_queries_bottom(context)
        # return "" unless context[:project] && context[:project].module_enabled?(:selectable_query)
 
        context[:controller].send(:render_to_string, {
          :partial => 'query_with_version/issues_sidebar_queries',
          :locals => context
        })
      end
    end
  end
end
