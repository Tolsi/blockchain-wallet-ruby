require File.expand_path('../wallet/version', __FILE__)
require File.expand_path('../web_api', __FILE__)
require "json"
require "oj"
require "immutable_struct"

module Blockchain

  class Wallet < WebAPI
    def initialize(guid, password, second_password)
      super("https://blockchain.info/merchant/#{guid}/")
      @guid = guid
      @password = password
      @second_password = second_password
    end


    def self.satoshi_to_bitcoins(satoshi)
      satoshi / (10 ** 8)
    end

    def self.bitcoins_to_satoshi(bitcoins)
      satoshi * (10 ** 8)
    end

    def addresses
      url = build_url("list", {:password => @password})
      handle(url) { |answer| answer.addresses }
    end

    def address_balance(address, confirmations = 0)
      url = build_url("address_balance", {:password => @password, :address => address, :confirmations => confirmations})
      handle(url) { |answer| answer }
    end

    def new_address(label = nil)
      url = build_url("new_address", {:password => @password, :second_password => @second_password, :label => label})
      handle(url) { |answer| answer }
    end

    def archive_address(address)
      url = build_url("archive_address", {:password => @password, :second_password => @second_password, :address => address})
      handle(url) { |answer| answer.archived == address }
    end

    def unarchive_address(address)
      url = build_url("unarchive_address", {:password => @password, :second_password => @second_password, :address => address})
      handle(url) { |answer| answer.active == address }
    end

    def auto_consolidate(days)
      url = build_url("auto_consolidate", {:password => @password, :second_password => @second_password, :days => days})
      handle(url) { |answer| answer.consolidated }
    end

    def payment(address, amount, from = nil, shared = nil, fee = nil, note = nil)
      url = build_url("payment", {:password => @password, :second_password => @second_password, :to => address, :amount => Wallet::bitcoins_to_satoshi(amount),
                                  :from => from, :shared => shared, :fee => fee, :note => note})
      handle(url) { |answer| answer }
    end

    def sendmany(recipients, from = nil, shared = nil, fee = nil, note = nil)
      url = build_url("sendmany", {:password => @password, :second_password => @second_password, :recipients => recipients,
                                  :from => from, :shared => shared, :fee => fee, :note => note})
      handle(url) { |answer| answer }
    end

    attr_reader :guid

    private

    class BlockchainException < Exception
    end

    def handle(url)
      answer = execute_request(url)
      check_error(answer)
      answer['balance'] = Wallet::satoshi_to_bitcoins(answer['balance']) if answer['balance']
      yield ImmutableStruct.new(*answer.keys.map(&:to_sym)).new(*answer.values)
    end

    def execute_request(url)
      json=open(URI.encode(url), :read_timeout => 10, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE).read
      parse_JSON(json)
    rescue Exception => ex
      raise BlockchainException, ex.message
    end

    def check_error(answer)
      error = answer['error']
      raise WebApiException, error if error
    end

    def parse_JSON(json)
      Oj.load(json, :class_cache => true)
    end

  end
end
