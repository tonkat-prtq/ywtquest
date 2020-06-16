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

  5.times do |n| 
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
      },
      {
        title: "テーブル設計が終わったのでCacooでER図を作ってみる",
        worktime: 60,
        log_id: 3
      },
      {
        title: "途中でユーザー機能のためのテーブルがなかったことに気づき、追加する",
        comment: "元あったカラムにもuser_idを追加するべきかどうかを考える",
        worktime: 60,
        log_id: 3
      },
      {
        title: "カテゴリーにユーザーIDを追加するか迷う",
        comment: "結局追加する",
        log_id: 3
      },
      {
        title: "画面遷移図を見様見真似で作ってみた",
        worktime: 75,
        log_id: 4
      },
      {
        title: "画面遷移図を見ながらラフ画をCacooで作った",
        comment: "一覧画面は苦戦しそうだったので紙とペンを使ったが、やっぱり苦戦したのでここは後回しにした",
        worktime: 186,
        log_id: 5
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
      },
      {
        title: "ER図作成はCacooがやりやすい",
        log_id: 3
      },
      {
        title: "user_idを紐付けることで自分が使ったカテゴリーだけ表示できるはず?",
        log_id: 3
      },
      {
        title: "user_idを紐付けなきゃいけないテーブルがたくさんあった",
        comment: "図を作ることで見落としに気づけた",
        log_id: 3
      },
      {
        title: "Cacooでは終点のスタイルを指定することで矢印ができる",
        log_id: 4
      },
      {
        title: "Cacooは超便利",
        comment: "綺麗にできればできるほどテンションが上がる",
        log_id: 5
      },
      {
        title: "時間かかりそうなやつは後回しにして、できそうなやつから片付けて行ったほうがいい",
        log_id: 5
      },
      {
        title: "ユーザー編集画面など、わざわざ用意しなくても実装できそう",
        log_id: 5
      },
      {
        title: "画面を作ると機能の見直しにもなる",
        log_id: 5
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
      },
      {
        title: "画面遷移図、ワイヤーフレームを作る",
        when_to_do: Time.now + 3.days,
        log_id: 3
      },
      {
        title: "カテゴリーにユーザーIDが本当に必要かもう一度考える",
        when_to_do: Time.now + 3.days,
        log_id: 3
      },
      {
        title: "画面遷移図の細かいところを詰める",
        when_to_do: Time.now + 3.days,
        log_id: 4
      },
      {
        title: "ワイヤーフレームに取り掛かる",
        when_to_do: Time.now + 3.days,
        log_id: 4
      },
      {
        title: "画面遷移図は今後も必ず作ってからアプリを作成したい",
        when_to_do: Time.now + 3.days,
        log_id: 4
      },
      {
        title: "一覧画面以外をぱぱっと作る",
        when_to_do: Time.now + 3.days,
        log_id: 5
      },
      {
        title: "機能の見直しもする",
        when_to_do: Time.now + 3.days,
        log_id: 5
      }
    ]
  )

end