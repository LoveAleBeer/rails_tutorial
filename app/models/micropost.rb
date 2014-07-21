class Micropost < ActiveRecord::Base
	belongs_to :user
	validates :user_id, presence: true
	validates :content, presence: true, length: { maximum: 140 }
	default_scope -> {order('created_at desc')} #常に降順で並ぶ

	def change
		create_table :microposts do |t|
			t.string :content
			t.integer :user_id
			t.timestamps
		end
		add_index :microposts, [:user_id, :created_at]
	end
end
