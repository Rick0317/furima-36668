# README

## users table
| Column             | Type   | Options                   | 
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true | 
| kanji_name         | string | null: false               |
| kana_name          | string | null: false               |
| encrypted_password | string | null: false               |

### Associations
- has_many :items
- has_many :comments
- has_one  :purchaser

## items table
| Column      | Type          | Options                   |
| ----------- | ------------- | ------------------------- |
| name        | string        | null: false               | 
| price       | int           | null: false               |
| description | text          | null: false               |
| user        | references    | foreign_key: true         |

### Associations
- belongs_to :user
- has_many :comments
- has_one  :purchaser

## comments table
| Column  | Type       | Options                   | 
| ------- | ---------- | ------------------------- |
| content | string     | null: false               |
| user    | references | foreign_key: true         |
| item    | references | foreign_key: true         |

### Associations
- belongs_to :user
- belongs_to :comment

## purchasers table
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
| phone_number  | int        | null: false               |          
| purchaser     | references | foreign_key: true         | 

### Associations
- belongs_to :purchaser

