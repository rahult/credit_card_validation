require 'turn/autorun'
require 'minitest/spec'
require 'minitest/autorun'
require 'credit_card_validation'
require 'active_record'
require 'pry'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => ':memory:'
)

ActiveRecord::Schema.define do

  self.verbose = false

  create_table :credit_cards, :force => true do |t|
    t.string :card_number
  end

  create_table :orders, :force => true do |t|
    t.string :card_number
  end

end