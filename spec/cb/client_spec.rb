require 'spec_helper'
require 'support/mocks/callback'
require 'support/mocks/request'
require 'support/mocks/response'

module Cb
  describe Cb::Client do
    let(:base_uri) { 'www.example.com' }

    context 'initialize' do
      it 'should not use a callback block' do
        client = Cb::Client.new()
        client.callback_block.should == nil
      end

      it 'should pass a correct callback' do
        client = Cb::Client.new {}
        client.callback_block.class.should == Proc
      end
    end

    context 'callback' do
      before :each do
        @callback_value = 'copy that ghost rider'
      end

      it 'should call a custom callback method' do
        callback_test = nil
        client = Cb::Client.new { |callback| callback_test = callback}
        client.callback_block.call(@callback_value)
        callback_test.should == @callback_value
      end
    end

    context 'api call no block' do

      let(:mock_api) { double(Cb::Utils::Api) }

      before :each do
        @client = Cb::Client.new
      end

      context 'post' do
        before :each do
          mock_api.stub(:execute_http_request).and_return(Hash.new)
          mock_api.stub(:append_api_responses)
          Cb::Utils::Api.stub(:new).and_return(mock_api)
          Cb::Utils::ResponseMap.stub(:response_for).and_return(Mocks::Response)

          @request = Mocks::Request.new(:post)
        end

        it 'should call the api using post' do
          mock_api.should_receive(:execute_http_request).
              with(:post, base_uri, 'parts unknown', {:query=>nil, :headers=>nil, :body=>nil}).
              and_return(Hash.new)

          @client.execute(@request)
        end
      end

      context 'get' do
        before :each do
          mock_api.stub(:execute_http_request).and_return(Hash.new)
          mock_api.stub(:append_api_responses)
          Cb::Utils::Api.stub(:new).and_return(mock_api)
          Cb::Utils::ResponseMap.stub(:response_for).and_return(Mocks::Response)

          @request = Mocks::Request.new(:get)
        end

        it 'should call the api using get' do
          mock_api.should_receive(:execute_http_request).
              with(:get, base_uri, 'parts unknown', {:query=>nil, :headers=>nil, :body=>nil}).
              and_return(Hash.new)

          @client.execute(@request)
        end
      end

      context 'put' do
        before :each do
          mock_api.stub(:execute_http_request).and_return(Hash.new)
          mock_api.stub(:append_api_responses)
          Cb::Utils::Api.stub(:new).and_return(mock_api)
          Cb::Utils::ResponseMap.stub(:response_for).and_return(Mocks::Response)

          @request = Mocks::Request.new(:put)
        end

        it 'should call the api using put' do
          mock_api.should_receive(:execute_http_request).
              with(:put, base_uri, 'parts unknown', {:query=>nil, :headers=>nil, :body=>nil}).
              and_return(Hash.new)

          @client.execute(@request)
        end
      end

    end
    context 'api call with block' do

      let(:mock_api) { double(Cb::Utils::Api) }

      before :each do
        @client = Cb::Client.new { |a| a }
      end

      context 'post' do
        before :each do
          mock_api.stub(:execute_http_request).and_return(Hash.new)
          mock_api.stub(:append_api_responses)
          Cb::Utils::Api.stub(:new).and_return(mock_api)
          Cb::Utils::ResponseMap.stub(:response_for).and_return(Mocks::Response)

          @request = Mocks::Request.new(:post)
        end

        it 'should call the api using post' do
          mock_api.should_receive(:execute_http_request).
              with(:post, base_uri, 'parts unknown', {:query=>nil, :headers=>nil, :body=>nil}).
              and_yield("test").
              and_return(Hash.new)

          @client.execute(@request)
        end
      end

      context 'get' do
        before :each do
          mock_api.stub(:execute_http_request).and_return(Hash.new)
          mock_api.stub(:append_api_responses)
          Cb::Utils::Api.stub(:new).and_return(mock_api)
          Cb::Utils::ResponseMap.stub(:response_for).and_return(Mocks::Response)

          @request = Mocks::Request.new(:get)
        end

        it 'should call the api using get' do
          mock_api.should_receive(:execute_http_request).
              with(:get, base_uri, 'parts unknown', {:query=>nil, :headers=>nil, :body=>nil}).
              and_yield("test").
              and_return(Hash.new)

          @client.execute(@request)
        end
      end

      context 'put' do
        before :each do
          mock_api.stub(:execute_http_request).and_return(Hash.new)
          mock_api.stub(:append_api_responses)
          Cb::Utils::Api.stub(:new).and_return(mock_api)
          Cb::Utils::ResponseMap.stub(:response_for).and_return(Mocks::Response)

          @request = Mocks::Request.new(:put)
        end

        it 'should call the api using put' do
          mock_api.should_receive(:execute_http_request).
              with(:put, base_uri, 'parts unknown', {:query=>nil, :headers=>nil, :body=>nil}).
              and_yield("test").
              and_return(Hash.new)

          @client.execute(@request)
        end
      end

    end


  end
end
