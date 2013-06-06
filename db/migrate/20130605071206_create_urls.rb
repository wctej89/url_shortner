class CreateUrls < ActiveRecord::Migration
  def change
  	create_table :urls do |t|
  		t.string  :url
  		t.string  :url_short
  		t.integer :counter, :default => 0
      t.integer :user_id
  	end
  end
end
