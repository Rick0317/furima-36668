# README

## users table
| Column             | Type   | Options                   | 
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true | 
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| kana_last_name     | string | null: false               |
| kana_first_name    | string | null: false               |
| birthday           | string | null: false               |
| encrypted_password | string | null: false               |

### Associations
- has_many :items
- has_many :comments
- has_many :purchaser

## items table
| Column        | Type          | Options                   |
| ------------- | ------------- | ------------------------- |
| name          | string        | null: false               | 
| price         | int           | null: false               |
| description   | text          | null: false               |
| state         | string        | null: false               |
| shipping_cost | string        | null: false               |
| region        | string        | null: false               |
| ship_length   | string        | null: false               |
| category      | string        | null: false               |
| user          | references    | foreign_key: true         |

### Associations
- belongs_to :user
- has_many :comments
- has_one  :purchase

## comments table
| Column  | Type       | Options                   | 
| ------- | ---------- | ------------------------- |
| content | string     | null: false               |
| user    | references | foreign_key: true         |
| item    | references | foreign_key: true         |

### Associations
- belongs_to :user
- belongs_to :comment

## purchases table
| Column | Type       | Options                   | 
| ------ | ---------- | ------------------------- |
| user   | references | foreign_key: true         |
| item   | references | foreign_key: true         |

### Associations
- has_one :address
- belongs_to :user
- belongs_to :item

## addresses table
| Column        | Type       | Options                   | 
| ------------- | ---------- | ------------------------- |
| mailing       | string     | null: false               |
| town          | string     | null: false               |          
| house_number  | string     | null: false               |
| building_name | string     |                           |
| phone_number  | string     | null: false               |          
| purchase      | references | foreign_key: true         | 

### Associations
- belongs_to :purchase

