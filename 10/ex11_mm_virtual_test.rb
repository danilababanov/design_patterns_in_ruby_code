#!/usr/bin/env ruby

require 'test/unit'
require 'pp'

require_relative 'ex1_account'
require_relative 'ex11_mm_virtual'

class MethodMissingVirtualProxyAccountTest < Test::Unit::TestCase


  def test_proxy
    proxy = VirtualProxy.new { BankAccount.new(100) }
    assert_nil proxy.instance_variable_get(:@subject)

    assert_equal 100, proxy.balance
    assert_not_nil proxy.instance_variable_get(:@subject)

    assert_equal 200, proxy.deposit(100)
    assert_equal 200, proxy.balance

    assert_equal 180, proxy.withdraw(20)
    assert_equal 180, proxy.balance
    assert_not_nil proxy.instance_variable_get(:@subject)
  end

end




