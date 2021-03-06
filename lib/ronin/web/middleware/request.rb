#
# Ronin Web - A Ruby library for Ronin that provides support for web
# scraping and spidering functionality.
#
# Copyright (c) 2006-2010 Hal Brodigan (postmodern.mod3 at gmail.com)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
#

require 'ronin/network/http/http'

require 'rack'

module Ronin
  module Web
    module Middleware
      class Request < Rack::Request

        #
        # The HTTP Headers for the request.
        #
        # @return [Hash{String => String}]
        #   The HTTP Headers of the request.
        #
        # @since 0.3.0
        #
        def headers
          headers = {}

          self.env.each do |name,value|
            if name =~ /^HTTP_/
              header_name = Network::HTTP.header_name(name.sub('HTTP_',''))
              headers[header_name] = value
            end
          end

          return headers
        end

      end
    end
  end
end
