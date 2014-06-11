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
      end
    end
  end
end

unless QueriesHelper.included_modules.include?(QueryWithVersion::QueriesHelperPatch)
  QueriesHelper.send(:include, QueryWithVersion::QueriesHelperPatch)
end
