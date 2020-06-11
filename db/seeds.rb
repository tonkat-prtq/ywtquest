require "csv"

CSV.foreach('db/level_setting(仮).csv', headers: true) do |row|
  LevelSetting.create(
    level: row[0],
    threshold: row[1]
  )
end

unless Rails.env.test? # テスト環境では以下のseedデータは不要
  firstuser = User.new(
    name: "first user",
    email: "firstuser@test.com",
    password: "password",
    id: 1
  )

  firstuser.skip_confirmation!
  firstuser.save!

  10.times do |n| 
    Log.create!(
      started_on: Time.now,
      ended_on: Time.now,
      user_id: 1
    )
  end

  Done.create!(
    [
      {
        title: "テーブル設計",
        comment: "どのテーブルにどうアソシエーションが必要かを考える",
        worktime: 120,
        log_id: 1
      },
      {
        title: "YWTとはそもそも何か？を再調査",
        log_id: 1
      },
      {
        title: "アプリの画面をノートに書く",
        comment: "一対多でいけるのか？多対多が必要なのかを考えた",
        log_id: 1
      }
    ],
  )

  Knowledge.create!(
    [
      {
        title: "アプリの設計が固まっていない",
        comment: "なので、テーブルやカラムの設計がうまくいかない",
        log_id: 1
      },
      {
        title: "画面から考えるのは良かったけど……",
        comment: "それによってアプリの設計や自分のやりたいことのズレが大きいことを認識した。テーブル設計をやり直す必要がありそう",
        log_id: 1
      },
      {
        title: "学習記録アプリを作っているが、画面を先に考えて、それから必要なテーブル、カラムを設計したほうが良さそう",
        log_id: 1
      }
    ]
  )

  Todo.create!(
    [
      {
        title: "学習記録作成と、その一覧画面をノートに書いてみる",
        when_to_do: Time.now + 3.days,
        log_id: 1
      },
      {
        title: "それをなるべく綺麗に清書する",
        when_to_do: Time.now + 3.days,
        log_id: 1,
      },
      {
        title: "アウトプット共有に貼ったり、メンターに相談してフィードバックもらう",
        when_to_do: Time.now + 3.days,
        log_id: 1
      },
      {
        title: "自分がこのアプリで実現したいこと、やりたいことを明確化する！",
        when_to_do: Time.now + 3.days,
        log_id: 1
      }
    ]
  )

  # 20.times do |no|
  #   Log.create(
  #     started_on: Time.now,
  #     ended_on: Time.now + 1.days,
  #     user_id: 1
  #   )

  #   Done.create(
  #     title: "やったこと #{no}",
  #     comment: "これやった",
  #     log_id: no
  #   )

  #   Knowledge.create(
  #     title: "わかったこと #{no}",
  #     comment: "これがわかった",
  #     log_id: no
  #   )

  #   Todo.create(
  #     title: "次やること #{no}",
  #     when_to_do: Time.now + 3.days,
  #     log_id: no
  #   )

  # end
end