#
# Cookbook Name:: mongotest
# Recipe:: test_replset_init
#
# Copyright 2015-2018 Andrei Skopenko
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
#

include_recipe 'mongotest::test_replset'

app_info = data_bag_item('keys', 'replset')

mongodb_replicaset 'TestReplSet' do
  members app_info['replset']
end
