# frozen_string_literal: true

require 'spec_helper'

module GraphQL
  class Requests
    class << self
      Dir[Rails.root.join('spec/gqls/**/*.gql.erb')].each do |gql_path|
        method_name = File.basename(gql_path, '.gql.erb')
        define_method method_name do |**args|
          request_body = ''
          File.open(gql_path) do |gql|
            bind = binding
            args.each do |name, value|
              bind.local_variable_set(name, value)
            end
            request_body = ERB.new(gql.read).result(bind)
          end
          request_body
        end
      end
    end
  end
end
