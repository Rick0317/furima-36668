# README

## users table
| Column   | Type   | Options                   | 
| -------- | ------ | ------------------------- |
| Name     | string | null: false               |
| Email    | string | null: false               | 
| encrypted_password | string | null: false               |

### Associations
- has_many :items
- has_many :comments
- has_one  :purchaser

## items table
| Column      | Type          | Options                   |
| ----------- | ------------- | ------------------------- |
| Name        | string        | null: false               | 
| Image       | activeStorage |                           |
| Description | string        | null: false               |
| User        | references    |                           |

### Associations
- belongs_to :user
- has_many :comments
- has_one  :purchaser

## comments table
| Column  | Type       | Options                   | 
| ------- | ---------- | ------------------------- |
| Content | string     | null: false               |
| User    | references |                           |
| Item    | references |                           |

### Associations
- belongs_to :user
- belongs_to :comment

## purchasers table
| Column | Type       | Options                   | 
| ------ | ---------- | ------------------------- |
| Name   | string     | null: false               |
| User   | references |                           |

### Associations
- has_one :address
- belongs_to :user
- belongs_to :item

## addresses table
| Column    | Type       | Options                   | 
| --------- | ---------- | ------------------------- |
| Content   | string     | null: false               |
| Purchaser | references |                           | 

### Associations
- belongs_to :purchaser

