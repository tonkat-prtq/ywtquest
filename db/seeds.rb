require "csv"

CSV.foreach('db/level_setting(仮).csv', headers: true) do |row|
  LevelSetting.create(
    level: row[0],
    threshold: row[1]
  )
end

firstuser = User.new(
  name: "first user",
  email: "firstuser@test.com",
  password: "password",
  id: 1
)

firstuser.skip_confirmation!
firstuser.save!

20.times do |no|
  Log.create(
    started_on: Time.now,
    ended_on: Time.now + 1.days,
    user_id: 1
  )

  Done.create(
    title: "やったこと #{no}",
    comment: "これやった",
    log_id: no
  )

  Knowledge.create(
    title: "わかったこと #{no}",
    comment: "これがわかった",
    log_id: no
  )

  Todo.create(
    title: "次やること #{no}",
    when_to_do: Time.now + 3.days,
    log_id: no
  )
end