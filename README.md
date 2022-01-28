# README

## user_manages table
| Column             | Type   | Options                   | 
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true | 
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| kana_last_name     | string | null: false               |
| kana_first_name    | string | null: false               |
| birthday           | date   | null: false               |
| encrypted_password | string | null: false               |

### Associations
- has_many :items
- has_many :comments
- has_many :purchases

## items table
| Column           | Type          | Options                        |
| ---------------- | ------------- | ------------------------------ |
| name             | string        | null: false                    | 
| price            | integer       | null: false                    |
| description      | text          | null: false                    |
| state_id         | integer       | null: false                    |
| shipping_cost_id | integer       | null: false                    |
| region_id        | integer       | null: false                    |
| ship_length_id   | integer       | null: false                    |
| category_id      | integer       | null: false                    |
| user_manage      | references    | null: false, foreign_key: true |

### Associations
- belongs_to :user_manage
- has_many :comments
- has_one  :purchase

## comments table
| Column      | Type       | Options                        | 
| ----------- | ---------- | ------------------------------ |
| content     | string     | null: false                    |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Associations
- belongs_to :user
- belongs_to :comment

## purchases table
| Column      | Type       | Options                        | 
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Associations
- has_one :address
- belongs_to :user_manage
- belongs_to :item

## addresses table
| Column        | Type       | Options                        | 
| ------------- | ---------- | ------------------------------ |
| mailing       | string     | null: false                    |
| region_id     | integer    | null: false                    |   
| town          | string     | null: false                    |          
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |          
| purchase      | references | null: false, foreign_key: true | 

### Associations
- belongs_to :purchase

