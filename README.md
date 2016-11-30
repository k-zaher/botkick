# Botkick


**Botkick** provides a skeleton for building chat bots on top of internal and external chat services. It:

- Currently supports only **Facebook Messenger**.
- Allows chaining multiple bots.
- Allows you to Build static bots with few commands.
- Gives you Full control for adding dynamic data to your bots.

It's composed the following components:

- **Serilaizers** modules that parse your static bot data. And serialize the final data to the format required by the chat service.
- **Template** Class stores the static bot data, and gives you control to edit its child components (buttons, text, etc...)
- **Node** module represents every step of your bot, it is aware about the **custom data** you sent in the previous node. It is also the place were you can add dynamic data to the attachments you send.

## Getting Started
Botkick **v0.0.1** works with Rails 4.1 onwards, you can add it to the Gemfile with

	gem 'botkick', :git => 'git://github.com/kimooz/botkick.git', :tag => 'v0.0.1'


Then run `bundle install`
 
## Create you first bot
 
First you need to run the generator for initializing your bot

	rails g botkick:bot first_bot
 
Then lets start creating the first node, for example: a welcome message.

	rails g botkick:node first_bot/welcome -view type
	
(Template) type  | Source 
-------------- | ----------- 
generic        | [Genertic Template](https://developers.facebook.com/docs/messenger-platform/send-api-reference/generic-template)
receipt        | [Receipt Template](https://developers.facebook.com/docs/messenger-platform/send-api-reference/receipt-template)
button         | [Button Template](https://developers.facebook.com/docs/messenger-platform/send-api-reference/button-template)
text           | [Text Template](https://developers.facebook.com/docs/messenger-platform/send-api-reference/text-message)

**Welcome Node** can have multiple templates, if at a certain level of the bot triggers multiple messages. You can simply generate them by:

	rails g botkick:node first_bot/welcome -view type_1, type_2
	
## TODO
- Add examples to generators output, and how to use them
- Add use case for merging dynamic data
- Explaining the flow from a high level


## Missing Features

- Support Another chat services.
- Grouping logic of a certain bot with multiple chat services

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/botkick. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

