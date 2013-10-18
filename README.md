# Blockchain.info Wallet API for Ruby

Provides access to all blockchain.info Wallet API functions ( https://blockchain.info/api/blockchain_wallet_api )

## Installation

Add this line to your application's Gemfile:

    gem 'blockchain-wallet'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install blockchain-wallet

## Usage

First you need to create wallet object with your guid, password and second password:

    wallet = BlockchainWallet::Wallet.new("b14d36af-2fa6-4d76-91b5-ff70b8370ec7", "n$grJ74hAshfggnb6864%j78@#^hChttp://ya.ru@contentpurl", nil)

Then your can call any API method to invoke him. For example:

    wallet.addresses

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

CC-BY 3.0
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND. Seriously, use it at your own risk.
