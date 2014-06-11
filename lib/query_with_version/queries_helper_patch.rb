# coding: utf-8

require_dependency 'queries_helper'

module QueryWithVersion
  module QueriesHelperPatch
    def self.included(base)
      base.send(:include, InstanceMethods)
      base.class_eval do
        unloadable

        alias_method_chain :retrieve_query, :version
      end
    end

    module InstanceMethods
      def retrieve_query_with_version
        retrieve_query_without_version
        if params[:query_id].present? and params[:fixed_version_id].present?
          @query.add_filter("fixed_version_id", "=", [params[:fixed_version_id]])
        end
      end
    end
  end
end

unless QueriesHelper.included_modules.include?(QueryWithVersion::QueriesHelperPatch)
  QueriesHelper.send(:include, QueryWithVersion::QueriesHelperPatch)
end
