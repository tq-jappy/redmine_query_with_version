require File.expand_path('../../../test_helper', __FILE__)

class QueriesHelperTest < ActionView::TestCase
  include QueriesHelper
  include SortHelper
  include Redmine::I18n

  fixtures :projects, :enabled_modules, :users, :members,
           :member_roles, :roles, :trackers, :issue_statuses,
           :issue_categories, :enumerations, :issues,
           :watchers, :custom_fields, :custom_values, :versions,
           :queries,
           :projects_trackers,
           :custom_fields_trackers

  def setup
    @session = nil
    @params = nil
  end

  context "QueriesHelper#retrieve_query" do
    context "with query_id and fixed_version_id given" do
      setup do
        User.current = User.find(1)
        @project = Project.find(1)
        @params = {:query_id => 1, :fixed_version_id => 1}
      end

      should "return query with filter fixed_version_id" do
        retrieve_query

        filters = @query.filters
        assert_equal filters["fixed_version_id"], {:operator => "=", :values => [1]}
      end

      should "store session query" do
        retrieve_query

        assert_equal session[:query][:id], 1
      end

      should "store session fixed_version_id in the query" do
        retrieve_query

        assert_equal session[:query][:fixed_version_id], 1
      end
    end
  end

  private

  def controller_name; 'foo'; end
  def action_name; 'bar'; end
  def api_request?; false; end
  def params; @params ||= {}; end
  def session; @session ||= {}; end
end
