# データベースのテーブル設計

## users
### association
* has_many :messages
* has_many :members
* has_many :groups, through: :members

### column
* name :string, null: false
* email :string, null: false
  add_index :users, :email, unique: true
* password :string, null: false


## messages
### association
* belongs_to :user
* belongs_to :group

### column
* body :text, null: false
* image :string
* references :user, foreign_key: true
* references :group, foreign_key: true


## groups
### association
* has_many :messages
* has_many :members
* has_many :users, through: :members

### column
* t.string :group_name

## members
### association
* belongs_to :user
* belongs_to :group

### column
* references :user, foreign_key: true
* references :group, foreign_key: true


-------------------------
## Ruby version
* 2.3.1
-------------------------
