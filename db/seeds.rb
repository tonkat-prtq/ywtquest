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
      },
      {
        title: "作成画面に必要なものをまず文で書き出してみる",
        comment: "その中から最低限これは実装しなきゃいけないものと、なくてもいいものを分ける。",
        worktime: 60,
        log_id: 2
      },
      {
        title: "その文から必要なフォームを考える",
        comment: "フォーム周りのデザインを考える",
        worktime: 60,
        log_id: 2
      },
      {
        title: "その入力画面と、YWTをどうやって関連付けさせるかを考える",
        comment: "確認画面でドラッグ＆ドロップが理想だけど、実現できるかは怪しい",
        worktime: 30,
        log_id: 2
      },
      {
        title: "その期間をまとめるLogというテーブルがあったほうがいいのでは？と思った",
        comment: "しかし、YWTが複数あってそれぞれが複雑に関連づいているものを、どうやって1つのテーブルで管理するのか検討がつかなかった。もしかしてcreated_atで持ってこれるかもしれない？とは考えた",
        worktime: 40,
        log_id: 2
      }
    ]
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
      },
      {
        title: "画面そのものを考える時に、デザインや細かい見た目は置いておかないとキリがない",
        comment: "とりあえずアプリとして機能する最低限のレベルまで一旦落として考えた結果、まあまあ進んだ",
        log_id: 2
      },
      {
        title: "日付は一日単位でも、一週間という範囲でも記録できるほうが良い",
        log_id: 2
      },
      {
        title: "カテゴリ選択は機能実装自体出来ても、それを扱いやすくするUIや実現するコードについては検討つかず難しそう",
        comment: "なのでそこまで追い求めないほうが良さそう",
        log_id: 2
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
      },
      {
        title: "テーブル設計、とりあえず出してみる。突っ返される前提で",
        when_to_do: Time.now + 3.days,
        log_id: 2
      },
      {
        title: "関連付けと中間テーブルも整理する",
        when_to_do: Time.now + 3.days,
        log_id: 2
      },
      {
        title: "頭が痛くなるようなテーブル設計だけでなく、楽しくなるようなこと（例えばロゴやカラー決めなど）をちょくちょく挟むと集中力が切れなくていいかも",
        when_to_do: Time.now + 3.days,
        log_id: 2
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