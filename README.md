StackDriver Ruby Client
=======================

A ruby client to send custom metrics to [StackDriver]().

Usage
-----

```ruby
require 'stackdriver'

# One time setup
customer_id = 1
api_key = "foo"
StackDriver.init customer_id, api_key

# Send single metric value
StackDriver.send_metric "test_metric", 666, Time.now.to_i

# Send single metric value with instance id
Stackdriver.send_metric "test_metric", 666, Time.now.to_i, "i-12345"
```

Software Verification
---------------------

This gem is signed with rubygems-openpgp.  You can verify its
integrity by running:

    gem install stackdriver --verify

Much more information on signing is available at the [rubygems-openpgp
Certificate Authority](https://www.rubygems-openpgp-ca.org).


Signing key:

    pub   2048R/E3B5806F 2010-01-11 [expires: 2014-01-03]
          Key fingerprint = A530 C31C D762 0D26 E2BA  C384 B6F6 FFD0 E3B5 806F
    uid                  Grant T. Olson (Personal email) <kgo@grant-olson.net>
    uid                  Grant T Olson <grant@webkite.com>
    uid                  Grant T. Olson (pikimal) <grant@pikimal.com>
    sub   2048R/6A8F7CF6 2010-01-11 [expires: 2014-01-03]
    sub   2048R/A18A54D6 2010-03-01 [expires: 2014-01-03]
    sub   2048R/D53982CE 2010-08-31 [expires: 2014-01-03]
