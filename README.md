# tsurami-vagrant

tsurami.com個人開発環境を構築するためのVagrantfile

## 行うこと

以下の構成で仮想マシンを作成する。

| 名前            | IPアドレス    | 説明            |
|-----------------|---------------|-----------------|
| tsurami-control | 192.168.56.10 | Control Machine |
| tsurami-local   | 192.168.56.20 | 開発環境        |

Windows機はAnsibleのControl Machineになれない。Ansibleを実行するための仮想マシンも作成する。

## 利用手順

### 1. Vagrantのインストール

https://www.vagrantup.com/ からVagrantのインストーラをダウンロード、インストールする。

### 2. VMの作成

HOW_TO_CREATE_VAGRANT_BOX.mdを参考にUbuntuのVagrant Boxを作成し、`tsurami/xenial64` という名前で `vagrant add` する。

[公式のVagrant Box](https://atlas.hashicorp.com/ubuntu/boxes/xenial64) にはvagrantユーザがない等の不具合がある。

### 3. 秘密鍵・公開鍵の用意

VMに設定するSSHの秘密鍵と公開鍵をそれぞれ以下のパスに配置する。

| 項目   | ファイルパス                        |
|--------|-------------------------------------|
| 秘密鍵 | `tsurami-vagrant/upload/id_rsa`     | 
| 公開鍵 | `tsurami-vagrant/upload/id_rsa.pub` |
 
### 4. vagrant up

Powershellで `vagrant up` を実行する

```cmd
cd tsurami-vagrant
vagrant up
```
