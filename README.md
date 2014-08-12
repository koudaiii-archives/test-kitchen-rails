test-kitchen-rails
==================


Overview
------

test-kichen-rails is install to nginx and puma and Ruby on Rails and MySQL.

Description
------

Usage
------

```
 $ git clone https://github.com/koudaiii/test-kitchen-rails.git
 $ bundle install
 $ vagrant plugin install dotenv
 $ vagrant plugin install sahara
 $ vagrant plugin install vagrant-omnibus
```

Tips
------

## Use sahara

```
 $ vagrant sandbox on
 $ vagrant sandbox reload
 $ vagrant sandbox off
```

## Use Chef-repo

```
 # Start provisioning, after install Chef
 $ knife solo bootstrap [IP or hostname]
 # Not Start provisioning
 $ knife solo prepare [IP or hostname]
```

