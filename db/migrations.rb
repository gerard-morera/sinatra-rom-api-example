def run_migrations(config)
  config.default.create_table(:movies) do
    primary_key :id
    string :title, null: false
    text :plot, null: false
    date :created_at, null: false
  end

  config.default.create_table(:seasons) do
    primary_key :id
    string :title, null: false
    text :plot, null: false
    date :created_at, null: false
  end

  config.default.create_table(:episodes) do
    primary_key :id
    string :title, null: false
    text :plot, null: false
    numeric :episode_number, null: false 
    date :created_at, null: false
    foreign_key :season_id, :seasons, null: false
  end

  config.default.create_table(:users) do
    primary_key :id
    string :email, null: false
  end

  config.default.create_table(:purchases) do
    primary_key :id
    number :target_id, null: false
    string :target_type, null: false
    string :video_quality, null: false
    foreign_key :user_id, :users, null: false
    date :created_at, null: false
  end
end