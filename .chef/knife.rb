cookbook_path    ["cookbooks", "site-cookbooks"]
node_path        "nodes"
role_path        "roles"
environment_path "environments"
data_bag_path    "data_bags"
#encrypted_data_bag_secret "data_bag_key"

knife[:berkshelf_path] = "cookbooks"
chef_server_url "http://127.0.0.1:8889"
node_name       "stickywicket"
client_key      File.join(File.dirname(__FILE__), "stickywicket.pem")
validation_key File.join(File.dirname(__FILE__), "stickywicket.pem")
cache_type      "BasicFile"
cache_options   :path => "#{chef_repo}/checksums"
