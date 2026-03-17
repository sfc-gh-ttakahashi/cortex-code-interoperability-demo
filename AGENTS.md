# EC Demo Project

## コンテキスト
このプロジェクトは EC サイトの分析基盤です。
- データベース: `DEMO_EC_DB`
- スキーマ: `PUBLIC`
- 主要テーブル: `customers`（顧客）、`products`（商品）、`orders`（注文）

## コーディング規約
- SQL は Snowflake SQL で書くこと
- カラム名・テーブル名は snake_case を使用する
- コメントは日本語で記述する
- テーブルやビューには必ず COMMENT を付与する
- 集計クエリでは CTE（WITH句）を使って段階的に組み立てる
- ランキングには QUALIFY + ROW_NUMBER を使用する（Snowflake の最適化を活用）

## ワークフロー規約
- 新しいテーブルやビューを作る前に、既存オブジェクトを確認する
- データ品質チェックには NULL 率・ユニーク率・値の範囲を含める
- 集計クエリの結果には必ず件数（row count）を添える

## 禁止事項
- 本番データベースへの直接 INSERT / UPDATE / DELETE は行わない
- ACCOUNTADMIN ロールは使用しない
