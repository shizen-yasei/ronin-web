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

require 'ipaddr'

module Ronin
  module Web
    module Middleware
      module Filters
        #
        # A Filter to match requests based on their IP Address.
        #
        class IPFilter

          #
          # Creates a new IP filter.
          #
          # @param [String, IPAddr] ip
          #   The IP Address to match against.
          #
          # @since 0.3.0
          #
          def initialize(ip)
            @ip = unless ip.kind_of?(IPAddr)
                    IPAddr.new(ip.to_s)
                  else
                    ip
                  end
          end

          #
          # Matches the filter against the request.
          #
          # @param [Rack::Request] request
          #   The incoming request.
          #
          # @return [Boolean]
          #   Specifies whether the filter matched the request.
          #
          # @since 0.3.0
          #
          def match?(request)
            @ip.include?(request.ip)
          end

        end
      end
    end
  end
end
