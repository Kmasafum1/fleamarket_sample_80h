# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday|integer|null: false|

### Association
- has_one :sending_destination
- has_one :card
- has_many :items

## cardsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|payjp_id|references|null: false|

### Association
- belongs_to :user

## sending_destinationsテーブル

|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|post_code|integer(7)|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building_name|string||
|phone_number|integer||

### Association
- belongs_to :user

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|condition|text|null: false|
|delivery_cost|integer|null: false|
|sipping_area|string|null: false|
|sipping_days|string|null: false|
|price|integer|null; false|
|category_id|references|null: false, foreign_key: true|
|brand_id|references|foreign_key: true|

### Association
- has_many :item_images
- belongs_to :category
- belongs_to :brand
- belongs_to :user

## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- belongs_to :item

## item_imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :item

## categoryテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null: false|

### Association
- has_many :items
