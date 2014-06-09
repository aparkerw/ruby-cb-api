require_relative '../base'

module Cb
  module Requests
    module ApplicationExternal
      class SubmitApplication < Base

        def endpoint_uri
          Cb.configuration.uri_application_external
        end

        def http_method
          :post
        end

        def body
          <<-eos
          <Request>
            <DeveloperKey>#{Cb.configuration.dev_key}</DeveloperKey>
            <EmailAddress>#{args[:email_address]}</EmailAddress>
            <JobDID>#{args[:job_did]}</JobDID>
            <SiteID>#{args[:site_id]}</SiteID>
            <IPath>#{ipath}</IPath>
            <IsExternalLinkApply>#{args[:is_external_link_apply]}</IsExternalLinkApply>
            <HostSite>#{args[:host_site] || Cb.configuration.host_site}</HostSite>
          </Request>
          eos
        end

        private

        def ipath
          return '' unless args[:ipath].is_a?(String)
          ipath_length = 10

          args[:ipath].slice(0, ipath_length)
        end

      end
    end
  end
end
