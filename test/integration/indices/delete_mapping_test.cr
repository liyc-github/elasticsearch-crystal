require "../../spec_helper"

module Elasticsearch
  module Test
    class IndicesDeleteMappingTest
      include Spec

      context "Indices: Delete Mapping: " do
        subject = Elasticsearch::Test::Client.new({:host => "localhost", :port => 9250})

        Spec.after_each do
          subject.indices.delete({:index => "test"})
        end

        it "delete a mapping" do
          subject.indices.create({:index => "test", :body => {"mappings" => {"type_1" => {} of String => String}}})
          subject.indices.delete_mapping({:index => "test", :type => "type_1"})
        end
      end
    end
  end
end
