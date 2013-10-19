require File.expand_path("../../lib/blockchain/wallet", __FILE__)

describe Blockchain::Wallet, ".addresses" do

  before do
    @wallet = Blockchain::Wallet.new("b14d36af-2fa6-4d76-91b5-ff70b8370ec7", "n$grJ74hAshfggnb6864%j78@#^hChttp://ya.ru@contentpurl", nil)
  end

  it "should returns all addresses" do
    addresses=@wallet.addresses
    addresses.should_not be_empty
  end

  after do
    @account = nil
  end

end

describe Blockchain::Wallet, ".address_balance" do

  before do
    @wallet = Blockchain::Wallet.new("b14d36af-2fa6-4d76-91b5-ff70b8370ec7", "n$grJ74hAshfggnb6864%j78@#^hChttp://ya.ru@contentpurl", nil)
  end

  it "should return '1JX7FrBm4Y96Z8BN6m9fWLN3bWVrEZ7dVs' balance >=0" do
    address_balance=@wallet.address_balance("1JX7FrBm4Y96Z8BN6m9fWLN3bWVrEZ7dVs")
    address_balance.balance.should >=(0)
  end

  after do
    @account = nil
  end

end