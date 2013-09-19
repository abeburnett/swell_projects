class UserBaseMigration < ActiveRecord::Migration
	def change

		create_table :roles do	|t|
			t.string 		:name
			t.timestamps
		end
		add_index :roles, :name


		create_table :user_roles do |t|
			t.references 	:user
			t.references	:granting_user
			t.references 	:role
			t.timestamps
		end

		add_index :user_roles, :user_id
		add_index :user_roles, :granting_user_id
		add_index :user_roles, :role_id


		create_table :users do |t|
			t.string		:name
			t.string 		:slug
			t.string 		:first_name
			t.string 		:last_name
			t.string 		:avatar
			t.datetime 		:birthday
			t.string		:gender
			t.string		:status,				default: 'active'
			t.string 		:website_url
			t.text 			:bio
			t.text 			:sig
			t.string		:ip
			t.float			:latitude
			t.float 		:longitude

			## Database authenticatable
			t.string		:email,					null: false, default: ""
			t.string		:encrypted_password,	null: false, default: ""

			## Recoverable
			t.string		:reset_password_token
			t.datetime		:reset_password_sent_at

			t.string		:password_hint
			t.string		:password_hint_response

			## Rememberable
			t.datetime		:remember_created_at

			## Trackable
			t.integer		:sign_in_count, :default => 0
			t.datetime		:current_sign_in_at
			t.datetime		:last_sign_in_at
			t.string		:current_sign_in_ip
			t.string		:last_sign_in_ip

			## Confirmable
			t.string		:confirmation_token
			t.datetime		:confirmed_at
			t.datetime		:confirmation_sent_at
			t.string		:unconfirmed_email # Only if using reconfirmable

			## Lockable
			t.integer		:failed_attempts, 		default: 0 # Only if lock strategy is :failed_attempts
			t.string		:unlock_token # Only if unlock strategy is :email or :both
			t.datetime		:locked_at

			## Token authenticatable
			t.string		:authentication_token

			t.timestamps
		end

		add_index :users, :name
		add_index :users, :slug, 					unique: true
		add_index :users, :email
		add_index :users, :reset_password_token,	unique: true
		add_index :users, :confirmation_token,		unique: true
		add_index :users, :unlock_token,			unique: true
		add_index :users, :authentication_token,	unique: true
	
	end

end

