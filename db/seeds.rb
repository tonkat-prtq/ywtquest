require "csv"

CSV.foreach('db/level_setting(仮).csv', headers: true) do |row|
  LevelSetting.create(
    level: row[0],
    threshold: row[1]
  )
end