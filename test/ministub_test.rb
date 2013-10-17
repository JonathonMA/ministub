require 'minitest/autorun'
require 'minitest/pride'

require 'ministub'

# :nodoc:
class MinistubTest < Minitest::Test
  def test_works
    a_stub = stub

    assert a_stub
  end

  def test_naming
    a_stub = stub :foo

    assert_match /foo/, a_stub.inspect
  end

  def test_query_methods
    a_stub = stub foo: 'bar'

    assert_equal 'bar', a_stub.foo
  end

  def test_query_callable
    a_stub = stub foo: -> { 'bar' }

    assert_equal 'bar', a_stub.foo
  end

  def test_method_with_parameters
    a_stub = stub foo: 'bar'

    assert_equal 'bar', a_stub.foo('baz')
  end

  def test_method_with_parameters
    a_stub = stub foo: ->(a) { a.upcase }

    assert_equal 'BAZ', a_stub.foo('baz')
  end

  def test_respond_to_acts_properly
    a_stub = stub foo: 'bar'

    assert a_stub.respond_to? :foo
  end

  def test_can_build_stubs_afterwards
    a_stub = stub

    a_stub.stub!(:foo) { 'foo' }

    assert_equal 'foo', a_stub.foo
  end

  def test_stub_bang_works_with_values
    a_stub = stub

    a_stub.stub! :foo, 'bar'

    assert_equal 'bar', a_stub.foo
  end

  def test_stub_bang_no_arguments_is_cool
    a_stub = stub

    a_stub.stub! :foo

    a_stub.foo
    assert true # no real assert, just making sure we don't raise
  end

  include Ministub::TestHelper
end
