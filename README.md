# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

## タイトル

dietary-management

## 企画背景

自身の栄養摂取状況を簡易的に可視化することで、生活習慣病の予防に努める。日々の積み重ねにより病気による出費や時間の浪費を減らすことを目的とする。

## 開発環境

rails 5.0
HTML5
CSS3

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null:false, unique: true, index: true|
|email|string|null:false, default: ""|
|encrypted_password|string|null:false, default: ""|
|gender|integer|null:false|
|age|integer|null:false|
|height|float|null:false|
|weight|float|null:false|
|bmi|float|null:false|
|integer|activity|null:false|
|intake_calorie|integer||

### Association
- has_many :foods
- belongs_to :management

## foodsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|calorie|integer||
|carbohydrate|float||
|protein|float||
|fat|float||
|salt_equivalent|float||
|dietary_fiber|float||

### Association
- has_many :managements, through: :management_foods
- has_many :users
- has_many :management_foods


## managementsテーブル

|Column|Type|Options|
|------|----|-------|
|content|string||
|image|string||
|day|date||
|title|string||
|user|references|foreign_key: true|

### Association
- belongs_to :user
- has_many :management_foods
- has_many :foods, through: :management_foods

## management_foodsテーブル

|Column|Type|Options|
|------|----|-------|
|management|references|foreign_key:true|
|food|references|foreign_key: true|

### Association
- belongs_to :management
- belongs_to :food
