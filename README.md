# test-databag
Rspec testing using data_bags

```
$ rspec -fd --color spec/

test-databag::default
  When server type is 'servertype_citrixserver'
    sees the nodename correctly
    creates the file /tmp/servertype_citrixserver
    converges successfully
  When server type is 'servertype_webserver'
    sees the nodename correctly
    creates the file /tmp/servertype_webserver
    converges successfully

Finished in 0.68269 seconds (files took 1.81 seconds to load)
6 examples, 0 failures
```
