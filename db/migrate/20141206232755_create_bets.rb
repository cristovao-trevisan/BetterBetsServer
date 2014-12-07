class CreateBets < ActiveRecord::Migration
  def up
    create_table :bets do |t|
			t.belongs_to :user
			t.integer :dared_user_id
			t.timestamp :start_date
			t.timestamp :end_date
			t.string :description, null: true, default: ""
			t.string :prize, null: true, default: ""
			t.string :user_url
			t.string :dared_user_url
    end
  end

	def down
		drop_table :bets
	end
end
