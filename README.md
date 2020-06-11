# YWT Quest

## 概要

YWT（やったこと・わかったこと・次やること）を記録して見える化することで学習のモチベーションを保ち、楽しく学習を習慣化します。

KPT（Keep・Problem・Try）だと、Problemばかりに目が行きがちであったり、重なるTryにめげそうになるので、学習段階ではYWTのほうがモチベーションが保たれます。

またゲーミフィケーションを取り入れ、記録すること自体が楽しみになります。

## コンセプト

KPTの代わりにYWTを使い、そのまま学習の記録としたかった。

## バージョン

Ruby 2.6.5

Ruby on Rails 5.2.4

## 機能一覧

- [ ] ログイン
- [ ] ユーザー登録
  - [ ] メールアドレス、名前、パスワードは必須
  - [ ] deviseを使用
  - [ ] SNSログイン
- [ ] ユーザー退会
- [ ] YWT一覧表示
  - [ ] Yだけ、Wだけ等で絞込表示
- [ ] YWT投稿
  - [ ] 1日単位でも、期間（例:4/20~4/27）でも登録可能
  - [ ] その日のログにYWTは複数登録可
  - [ ] タグ付け機能
- [ ] YWT編集
- [ ] YWT削除
- [ ] レベルアップ機能

## カタログ設計

<https://docs.google.com/spreadsheets/d/1ulOsu2guBDWNuytJj0uF_JhwTA1Jxa8RQbkVgi-vGgE/edit#gid=0>

## テーブル設計

<https://docs.google.com/spreadsheets/d/153c7VbDiDlCSFhpqOqxcaRRo_OPH2HX_St2hS0f4vyU/edit?usp=sharing>

### Logテーブルの有無について

今回はLogテーブルありを採用

**自分が考えるメリット**

- Logを呼び出せば指定期間内のYWTが取得出来るので、走るSQLが少なくて済みそう
- そのユーザーのYWTを取得したい時に、Logテーブル有りのほうが簡単にすむ（なしだと3つのテーブルを見に行かないといけないのに比べ、ありだとLogテーブルを見に行くだけで良い）

**デメリット**

- 期間や日付の情報も含めたYWTを取得する際はLogを経由しなくてはならない
- フォームの実装やデータの扱いが面倒くさそう。苦戦しそう

**Logテーブルなしのメリット**

- 複雑なアソシエーションがないのでデータの作成や更新・表示を実装するためのコードが少なくて済みそう
- YWTの3つをまとめたログを作成するという概念がなくなるので、その都度Yだけ記録、Wだけ記録のようなラフな使い方が可能になりそう

**Logテーブルなしのデメリット**

- 期間内のYWTを取得するとき、started_onとended_onの値を3つのテーブルで調べなくてはならないので処理が重そう

LogテーブルなしのER図

<https://docs.google.com/spreadsheets/d/155HWYiLlUswOmx9BND5r-Xk5Ar12cVB8uBuODmw-ABw/edit?usp=sharing>

## 画面遷移図

<https://docs.google.com/spreadsheets/d/1ulOsu2guBDWNuytJj0uF_JhwTA1Jxa8RQbkVgi-vGgE/edit#gid=1527600181>

## ラフ画

<https://docs.google.com/spreadsheets/d/1ulOsu2guBDWNuytJj0uF_JhwTA1Jxa8RQbkVgi-vGgE/edit#gid=852384761##>

## 使用Gem

- Devise
- Simple_Form
- acts-as-taggable-on
- cocoon
- kaminari
- slim-rails
