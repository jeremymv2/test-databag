# test-databag
Rspec testing using data_bags

```
$ rspec -fd --color spec/

test-databag::default
  When server type from data_bag is 'servertype_citrixserver'
    sees the nodename correctly
    creates the appropriate file /tmp/servertype_citrixserver
    converges successfully
  When server type from data_bag is 'servertype_webserver'
    sees the nodename correctly
    creates the appropriate file /tmp/servertype_webserver
    converges successfully

Finished in 0.6892 seconds (files took 2 seconds to load)
6 examples, 0 failures
```
