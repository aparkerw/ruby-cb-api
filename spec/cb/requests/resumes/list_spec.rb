require 'spec_helper'

module Cb
  describe Cb::Requests::Resumes::List do

    context 'initialize without arguments' do
      context 'without arguments' do
        let(:request) { Cb::Requests::Resumes::List.new({}) }

        it 'will be correctly configured' do
          request.endpoint_uri.should == Cb.configuration.uri_resume_list
          request.http_method.should == :get
        end

        it 'will have a basic query string' do
          request.query.should eq({ HostSite: Cb.configuration.host_site, OAuthToken: nil })
        end

        it 'will have basic headers' do
          request.headers.should == nil
        end

        it 'will have a basic body' do
          request.body.should == nil
        end
      end

      context 'with arguments' do
        let(:request) { Cb::Requests::Resumes::List.new({ oauth_token: 'token' }) }

        it 'will be correctly configured' do
          request.endpoint_uri.should == Cb.configuration.uri_resume_list
          request.http_method.should == :get
        end

        it 'will have a basic query string' do
          request.query.should eq ({ HostSite: Cb.configuration.host_site, OAuthToken: 'token' })
        end

        it 'will have basic headers' do
          request.headers.should == nil
        end

        it 'will have a basic body' do
          request.body.should == nil
        end
      end
    end

  end
end
