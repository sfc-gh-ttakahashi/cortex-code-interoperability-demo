-- データベース・スキーマの作成
CREATE OR REPLACE DATABASE DEMO_EC_DB;
USE DATABASE DEMO_EC_DB;
USE SCHEMA PUBLIC;

-- 顧客マスタ
CREATE OR REPLACE TABLE customers (
    customer_id INT AUTOINCREMENT,
    name STRING,
    email STRING,
    prefecture STRING COMMENT '都道府県',
    registered_at TIMESTAMP_NTZ
) COMMENT = 'EC顧客マスタ';

-- 商品マスタ
CREATE OR REPLACE TABLE products (
    product_id INT AUTOINCREMENT,
    product_name STRING,
    category STRING,
    price NUMBER(10,2)
) COMMENT = 'EC商品マスタ';

-- 注文トランザクション
CREATE OR REPLACE TABLE orders (
    order_id INT AUTOINCREMENT,
    customer_id INT,
    product_id INT,
    quantity INT,
    order_date DATE,
    status STRING COMMENT 'completed / cancelled / pending'
) COMMENT = 'EC注文トランザクション';

-- サンプルデータ: 商品
INSERT INTO products (product_name, category, price) VALUES
    ('ワイヤレスイヤホン', '家電', 4980),
    ('プロテイン 1kg', '食品', 3280),
    ('ランニングシューズ', 'スポーツ', 12800),
    ('技術書 SQLマスター', '書籍', 3520),
    ('コーヒーメーカー', '家電', 8900);

-- サンプルデータ: 顧客
INSERT INTO customers (name, email, prefecture, registered_at) VALUES
    ('田中太郎', 'tanaka@example.com', '東京都', '2024-01-15 10:00:00'),
    ('佐藤花子', 'sato@example.com', '大阪府', '2024-03-22 14:30:00'),
    ('鈴木一郎', 'suzuki@example.com', '愛知県', '2024-06-01 09:15:00'),
    ('高橋美咲', 'takahashi@example.com', '福岡県', '2024-08-10 16:45:00'),
    ('伊藤健太', 'ito@example.com', '北海道', '2025-01-05 11:20:00');

-- サンプルデータ: 注文
INSERT INTO orders (customer_id, product_id, quantity, order_date, status) VALUES
    (1, 1, 1, '2025-01-10', 'completed'),
    (1, 3, 1, '2025-01-15', 'completed'),
    (2, 2, 2, '2025-01-20', 'completed'),
    (3, 4, 1, '2025-02-01', 'completed'),
    (4, 5, 1, '2025-02-05', 'cancelled'),
    (2, 1, 1, '2025-02-10', 'completed'),
    (5, 2, 3, '2025-02-15', 'pending'),
    (1, 4, 1, '2025-03-01', 'completed'),
    (3, 3, 2, '2025-03-05', 'completed'),
    (4, 1, 1, '2025-03-10', 'completed');

