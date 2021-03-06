require 'spec_helper'

module Cb
  describe Cb::Requests::User::Retrieve do

    context 'initialize without arguments' do
      context 'without arguments' do
        before(:each) { @request = Cb::Requests::User::Retrieve.new({}) }

        it 'should be correctly configured' do
          @request.endpoint_uri.should == Cb.configuration.uri_user_retrieve
          @request.http_method.should == :post
        end

        it 'should have a basic query string' do
          @request.query.should == nil
        end

        it 'should have basic headers' do
          @request.headers.should == nil
        end

        it 'should have a basic body' do
          @request.body.should == <<-eos
            <Request>
              <DeveloperKey>#{Cb.configuration.dev_key}</DeveloperKey>
              <ExternalID></ExternalID>
              <Test>false</Test>
            </Request>
          eos
        end
      end

      context 'with arguments' do
        before :each do
          @request = Cb::Requests::User::Retrieve.new({
            :external_id => 'external id',
            :test => 'true'
          })
        end

        it 'should be correctly configured' do
          @request.endpoint_uri.should == Cb.configuration.uri_user_retrieve
          @request.http_method.should == :post
        end

        it 'should have a basic query string' do
          @request.query.should == nil
        end

        it 'should have basic headers' do
          @request.headers.should == nil
        end

        it 'should have a basic body' do
          @request.body.should == <<-eos
            <Request>
              <DeveloperKey>#{Cb.configuration.dev_key}</DeveloperKey>
              <ExternalID>external id</ExternalID>
              <Test>true</Test>
            </Request>
          eos
        end
      end
    end

  end
end
