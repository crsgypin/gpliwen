# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



owner = AccountOwner.create(:name=>"繼平")
AccountEntity.create(:name=>"現金",:account_owner=>owner)
AccountEntity.create(:name=>"台北銀行",:account_owner=>owner,:description=>"012xxx")
AccountEntity.create(:name=>"國泰信用卡",:account_owner=>owner,:description=>"014xx")

owner = AccountOwner.create(:name=>"麗文")
AccountEntity.create(:name=>"現金",:account_owner=>owner)
AccountEntity.create(:name=>"中信",:account_owner=>owner,:description=>"092xxx")

owner = AccountOwner.create(:name=>"共同基金")
AccountEntity.create(:name=>"中信",:account_owner=>owner,:description=>"095xxx")

