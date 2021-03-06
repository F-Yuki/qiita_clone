class DeviseTokenAuthCreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table(:users) do |t|
      ## Required
      t.string :provider, null: false, default: "email"
      t.string :uid, null: false, default: ""

      ## Database authenticatable/DBに保存するパスワードの暗号化(必須)
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable/パスワードリセット
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.boolean  :allow_password_change, default: false

      ## Rememberable/クッキーにログイン情報を保持
      t.datetime :remember_created_at

      ## trackable/サインイン回数・時刻・IPアドレスを保存
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable/メール送信による登録確認
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable/一定回数ログインに失敗した際のアカウントロック
      # t.integer  :failed_attempts, :default => 0, :null => false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      ## User Info
      t.string :name
      t.string :nickname
      t.string :image
      t.string :email

      ## Tokens
      t.text :tokens

      t.timestamps
    end

    change_table :users, bulk: true do |t|
      t.index :email,                unique: true
      t.index [:uid, :provider],     unique: true
      t.index :reset_password_token, unique: true
      t.index :confirmation_token,   unique: true
      # t.index :unlock_token,         unique: true
    end
  end
end
