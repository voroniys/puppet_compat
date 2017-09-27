#
# Cookbook:: puppet_compat
# Library:: inifile_resource
#
# Copyright:: 2017, Stanislav Voroniy
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
require 'chef/resource'

class Chef
  class Resource
    # Resource decleration for IniSetting resource
    class IniSetting < Chef::Resource
      identity_attr :name
      def initialize(name, run_context = nil)
        super
        @resource_name = :ini_setting
        @action = :ensure
        @allowed_actions = [:ensure, :delete, :nothing]
        @provider = Chef::Provider::IniSetting
      end

      def path(arg = nil)
        set_or_return(
          :path,
          arg,
          kind_of: String,
          required: true
        )
      end

      def section(arg = nil)
        set_or_return(:section, arg, kind_of: String)
      end

      def setting(arg = nil)
        set_or_return(:setting, arg, kind_of: String)
      end

      def value(arg = nil)
        set_or_return(:value, arg, kind_of: String)
      end

      def separator(arg = nil)
        set_or_return(:separator, arg, kind_of: String)
      end
    end
  end
end
# vim:ts=2:sw=2:expandtab