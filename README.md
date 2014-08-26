test-kitchen-rails
==================

[![wercker status](https://app.wercker.com/status/fea7be3fadc1bda1f651e9caa0550d5c/m "wercker status")](https://app.wercker.com/project/bykey/fea7be3fadc1bda1f651e9caa0550d5c)

Overview
------

test-kichen-rails is install to nginx and puma and Ruby on Rails and MySQL.

Description
------

Install
------

```
 $ git clone https://github.com/koudaiii/test-kitchen-rails.git
 $ bundle install
 $ bundle exec kitchen create
 $ bundle exec kitchen setup
 $ bundle exec kitchen converge
 $ bundle exec kitchen test
```

```
 # Start provisioning, after install Chef
 $ knife solo bootstrap webapp|| [IP ||  hostname]
```

* Local Host IP Address 192.168.33.10
* Server(Before SSH login on the local server and can sudo)
* DigitalOcen(Config Setting file .env)
* AWS EC2

Tips
------

## Use sahara

```
 $ vagrant sandbox on
 $ vagrant sandbox rollback
 $ vagrant sandbox off
```

## Use Chef-solo

```
 # Install Chef
 $ knife solo prepare vagrant@webapp
 # provisionning cookbook
 $ bundle exec knife solo cook webapp
 # Start provisioning, after install Chef
 $ knife solo bootstrap [IP or hostname]
 # Not Start provisioning
 $ knife solo prepare [IP or hostname]
```

Contribution
------

```
 $ git clone https://github.com/koudaiii/test-kitchen-rails.git
 $ bundle install
 $ bundle exec berks
 $ bundle exec berks vendor cookbooks
 $ vagrant plugin install dotenv
 $ vagrant plugin install sahara
 $ vagrant plugin install vagrant-omnibus
 $ vagrant plugin install vagrant-berkshelf
 $ vagrant ssh-config --host webapp >> ~/.ssh/config
 $ bundle exec kitchen create
 $ bundle exec kitchen setup
 $ bundle exec kitchen converge
 $ bundle exec kitchen test
```

FAQ
------

### ERROR: Your private key could not be loaded from /etc/chef/client.pem

* add -z option

```
 $ bundle exec knife cookbook site show apache -z
```
