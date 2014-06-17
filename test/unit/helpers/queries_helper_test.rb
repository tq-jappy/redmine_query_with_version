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
    User.current = User.find(1)
  end

  context "QueriesHelper#retrieve_query" do
    context "context with project" do
      setup do
        @project = Project.find(1)
      end

      context "and params(query id, fixed version id)" do
        setup do
          @params = {:query_id => 1, :fixed_version_id => 1}

          retrieve_query
        end

        should "return query with filter fixed_version_id" do
          assert_equal @query.filters["fixed_version_id"], {:operator => "=", :values => [1]}
        end

        should "store session query" do
          assert_equal session[:query][:id], 1
        end

        should "store session fixed_version_id in the query" do
          assert_equal session[:query][:fixed_version_id], 1
        end

        should "set @querying_version" do
          assert_equal @querying_version, Version.find(1)
        end
      end

      context "and params(query id only)" do
        setup do
          @params = {:query_id => 1}

          retrieve_query
        end

        should "store session query" do
          assert_equal session[:query][:id], 1
        end

        should "return query without fixed_version_id" do
          assert_nil @query.filters["fixed_version_id"]
        end

        should "not set @querying_version" do
          assert_nil @querying_version
        end
      end
    end

    context "context without project" do
      setup do
        @project = nil
      end

      context "and params(query id, fixed version id)" do
        setup do
          @params = {:query_id => 3, :fixed_version_id => 1}

          retrieve_query
        end

        should "return query with filter fixed_version_id" do
          assert_equal @query.filters["fixed_version_id"], {:operator => "=", :values => [1]}
        end

        should "store session query" do
          assert_equal session[:query][:id], 3
        end

        should "store session fixed_version_id in the query" do
          assert_equal session[:query][:fixed_version_id], 1
        end

        should "set @querying_version" do
          assert_equal @querying_version, Version.find(1)
        end
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
