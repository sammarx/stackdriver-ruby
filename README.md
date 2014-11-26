StackDriver Ruby Client
=======================

A ruby client to send custom metrics to [StackDriver]().

Usage
-----

```ruby
require 'stackdriver'

# One time setup
api_key = "foo"
StackDriver.init api_key

# Send single metric value
StackDriver.send_metric "test_metric", 666, Time.now.to_i

# Send single metric value with instance id
Stackdriver.send_metric "test_metric", 666, Time.now.to_i, "i-12345"

# Send multiple metric values with instance_id
Stackdriver.send_multi_metric data_point_array

where data is an array of this type:
data = [
  {
     'name': 'my_custom_metric1',
     'value': 32,
     #Note: Stackdriver rejects when the collected_at value is older than 2 hours.
     'collected_at': 1325394000,
     #Note: Include an instance value if your metric is tied to an instance.
     #'instance': 'i-XXXXXXXX',
  },
  {
     'name': 'my_custom_metric2',
     'value': 37,
﻿     #Note: Stackdriver rejects when the collected_at value is older than 2 hours.
     'collected_at': 1325394000,
     #Note: Include an instance value if your metric is tied to an instance.
     #'instance': 'i-XXXXXXXX',
  }
]
```

# Delete single metric value
# Note that the removal will take effect roughly two hours after the request has been sent
StackDriver.delete_metric "test_metric", Time.now.to_i

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
