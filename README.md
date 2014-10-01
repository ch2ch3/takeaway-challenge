Takeaway Challenge
==================
Part 2 of this week's challenge was to write a class Takeaway that can list dishes and place orders. Upon placing the order, the customer receives a text message informing them that the order will be delivered in the next hour.

Technologies used:
- Ruby
- RSpec
- Twilio API

How to use
----------
Clone the repository:
```shell
$ git clone git@github.com:ch2ch3/takeaway-challenge.git
```

Change into the directory:
```shell
$ cd takeaway-challenge
```

Create a tokens.rb file:
```shell
$ touch lib/tokens.rb
```

Sign up for a free Twilio account and populate the tokens.rb file with your Twilio tokens in the following format:

```
class Tokens

  ACCOUNT_SID = '(replace this with your ACCOUNT_SID)'
  AUTH_TOKEN = '(replace this with your AUTH_TOKEN)'
  PHONE_NUMBER = '(replace this with your phone number)'

end
```

To run the tests:
```shell
$ rspec
```

To check out the code, open in IRB and require the files:
```shell
$ irb
  > require './lib/tokens'
  > require './lib/twilio'
  > require './lib/takeaway'
```

Create a new takeaway:
```shell
  > takeaway = Takeaway.new
```

Display the menu:
```shell
  > takeaway.show_menu
```

Order an item (use the number of the menu item):
```shell
  > takeaway.order(1)
```

To check the current order:
```shell
  > takeaway.show_current_order
```

To place the order:
```shell
  > takeaway.place_order
```