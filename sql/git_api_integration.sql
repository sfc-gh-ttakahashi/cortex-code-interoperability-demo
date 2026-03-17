-- GitHub の Public リポジトリ用 API Integration を作成する
-- API_ALLOWED_PREFIXES にはリポジトリ URL のプレフィックスを指定する
-- アカウント（組織またはユーザー）単位で指定しておくと、
-- 同じアカウント配下の複数リポジトリに対してこの Integration を共用できる
CREATE OR REPLACE API INTEGRATION demo_git_api_integration
    API_PROVIDER = git_https_api
    API_ALLOWED_PREFIXES = ('https://github.com/sfc-gh-ttakahashi')
    ENABLED = TRUE;
