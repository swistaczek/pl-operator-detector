= pl-operator-detector
[![Build Status](https://travis-ci.org/swistaczek/pl-operator-detector.png)](https://travis-ci.org/swistaczek/pl-operator-detector)

PlOperatorDetector is simple ruby wrapper arround few web services allowing user to check network name assigned to provided mobile phone number.

== Usage example

```ruby
 > require 'pl-operator-detector'
 => true 
 > PlOperatorDetector.new.find('696 666 333')
 => {:number=>"48696666333", :operator_code=>"260 02", :operator=>"PTC / T-Mobile"}
 # OR - :operator_code is optional response
 => {:number=>"48696666333", :operator=>"PTC / T-Mobile"} 
```



== Contributing to pl-operator-detector
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

== Copyright

Copyright (c) 2013 Ernest Bursa. See LICENSE.txt for
further details.