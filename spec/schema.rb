ActiveRecord::Schema.define(:version => 0) do
  create_table :blogs, :force => true do |t|
    t.column :title, :string
    t.column :text, :body
  end

  create_table :replies, :force => true do |t|
    t.column :blog_id, :integer
    t.column :author, :string
    t.column :body, :string
  end
end