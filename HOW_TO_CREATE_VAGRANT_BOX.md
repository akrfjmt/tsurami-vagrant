# Vagrant Boxの作成手順

Windows 10上でUbuntu 16.04のVagrant Boxを作る。

## 参考文献

* [Vagrant - Creating a Base Box](https://www.vagrantup.com/docs/virtualbox/boxes.html)
* [Vagrant - Insecure Keypair](https://github.com/mitchellh/vagrant/tree/master/keys)

## 事前準備

* VirtualBoxをインストールする。
    * [ダウンロードページ](https://www.virtualbox.org/wiki/Downloads)
* Vagrantをインストールする。
    * [ダウンロードページ](https://www.vagrantup.com/downloads.html)
* `ubuntu-16.04.1-server-amd64.iso` をダウンロードする。
    * [ダウンロードページ](http://releases.ubuntu.com/16.04/)
* RLoginをインストールする。
    * [ダウンロードページ](http://nanno.dip.jp/softlib/man/rlogin/)

## 仮想マシン作成

* Oracle VM VirtualBox マネージャーを起動する。
* 「新規」ボタンを押し、「仮想マシンの作成」ウインドウを開く。
    * 「名前」に `tsurami/xenial64` を入力する。
    * 「作成」ボタンを押し、「仮想ハードディスクの作成」ウインドウを開く。
    * 「ファイルサイズ」に `100.00GB` を入力する。
    * 「作成」ボタンを押す。
* 「設定」を推し、 「tsurami/xenial64 - 設定」ウインドウを開く。
    * 「システム」を選択する。
        * 「マザーボード」「フロッピー」のチェックを外す。
    * 「ストレージ」を選択する。
        * 「ストレージツリー」「コントローラー: IDE」「空」を選択する。
        * 「属性」「光学ドライブ」「💿」「仮想光学ディスクファイルを選択」を押し、 `ubuntu-16.04.1-server-amd64.iso` を選択する。
        * 「ストレージツリー」「コントローラー: SATA」「tsurami_xenial64.vdi」を選択する。
        * 「属性」「ハードディスク」「SSD(Solid-state drive)」にチェックを入れる。
    * 「オーディオ」を選択する。
        * 「オーディオを有効化」のチェックを外す。
    * 「ネットワーク」を選択する。
        * 「アダプター 1」「高度」「ポートフォワーディング」ボタンを押す。
        * 「＋」ボタンを押す。
        * 「ホストポート」に `2222` を入力する。
        * 「ゲストポート」に `22` を入力する。
        * 「OK」ボタンを押す。
    * 「OK」ボタンを押す。
* 「起動」ボタンを押し、仮想マシンを起動する。

## VirtualBox VM画面上での作業

* Language
    * 「English」を選択する。
* ubuntu
    * 「Install Ubuntu Server」を選択する。
* Select a language - Language
    * カーソルキーで「English - English」を選択してEnterキーを押す。
* Select your location - Country, territory or area
    * カーソルキーで「other」を選択してEnterキーを押す。
* Select your location - Continent or region
    * カーソルキーで「Asia」を選択してEnterキーを押す。
* Select your location - Country, territory or area
    * カーソルキーで「Japan」を選択してEnterキーを押す。
* Configure locales - Country to base default locale settings on
    * カーソルキーで「United States - en_US.UTF-8」を選択してEnterキーを押す。
* Configure the keyboard - Detect keyboard layout?
    * カーソルキーで「No」を選択してEnterキーを押す。
* Configure the keyboard - Country of origin for the keyboard
    * カーソルキーで「English (US)」を選択してEnterキーを押す。 
* Configure the keyboard - Keyboard layout
    * カーソルキーで「English (US)」を選択してEnterキーを押す。
* （少し待つ）
* Configure the network - Hostname
    * `ubuntu` が入力されていることを確認する。
    * カーソルキーで「Continue」を選択してEnterキーを押す。
* Set up users and passwords - Full name for the new user
    * 値が空白であることを確認する。
    * カーソルキーで「Continue」を選択してEnterキーを押す。
* Set up users and passwords - Username for your account 
    * `vagrant` を入力する。
    * カーソルキーで「Continue」を選択してEnterキーを押す。
* Set up users and passwords - Choose a password for the new user
    * `vagrant` を入力する。
    * カーソルキーで「Continue」を選択してEnterキーを押す。
* Set up users and passwords - Re-enter password to verify
    * `vagrant` を入力する。
    * カーソルキーで「Continue」を選択してEnterキーを押す。
* Set up users and passwords - Use weak password?
    * カーソルキーで「Yes」を選択してEnterキーを押す。
* Set up users and passwords - Encrypt your home directory?
    * カーソルキーで「No」を選択してEnterキーを押す。
* （少し待つ）
* Configure the clock - Is this time zone correct?
    * 「Based on your present physical location, your time zone is Asia/Tokyo.」 と表示されていることを確認する。
    * カーソルキーで「Yes」を選択してEnterキーを押す。
* （少し待つ）
* Partition disks - Partitioning method
    * カーソルキーで「Guided - use entire disk」を選択してEnterキーを押す。
* Partition disks - Select disk to partition
    * カーソルキーで「SCSI3 (0,0,0) (sda) - 107.4 GB ATA VBOX HARDDISK」を選択してEnterキーを押す。
* Partition disks - Write the changes to disk?
    * カーソルキーで「Yes」を選択してEnterキーを押す。
* （少し待つ）
* Configure the package manager - HTTP proxy information (blank for none)
    * 値が空白であることを確認する。
    * カーソルキーで「Continue」を選択してEnterキーを押す。
* （少し待つ）
* Configuring tasksel - How do you want to manage upgrades on this system?
    * 「No automatic updates」を選択してEnterキーを押す。
* Software selection - Choose software to install
    * 「standard system utilities」のチェックを外す。
    * 「OpenSSH server」のチェックを入れる。
    * Enterキーを押す。
* （少し待つ）
* Install the GRUB boot loader on a hard disk - Install the GRUB boot loader to the master boot record?
    * カーソルキーで「Yes」を選択してEnterキーを押す。
* （少し待つ）
* Finish the installation
    * カーソルキーで「Continue」を選択してEnterキーを押し、仮想マシンを再起動する。
* （少し待つ） 
* 「Ubuntu 16.04.1 LTS ubuntu tty1」「ubuntu login:」と表示されていることを確認する。

## SSHログインによる作業

### RLoginによる仮想マシンへの接続

* RLoginを起動する。
* 「ファイル」「サーバーに接続」メニューを選択し、「Server Select」ウインドウを開く。
    * 「新規」ボタンを押し、「Server New Entry」ウインドウを開く。
        * 「サーバー」を選択する。
            * 「エントリー/コメント」に `localhost-vagrant-password` を入力する
            * 「プロトコル」は「ssh」を選択する。
            * 「オプション」「Server Address」に `localhost` を入力する。
            * 「オプション」「ServerPort」に `2222` を入力する。
            * 「オプション」「User Name」に `vagrant` を入力する。
            * 「オプション」「Password」に `vagrant` を入力する。
            * 「デフォルト文字セット」は「UTF-8」を選択する。
        * 「OK」ボタンを押す。
    * 「localhost-vagrant」を選択し、「OK」ボタンを押し、仮想マシンに接続する。
* 「公開鍵の確認」ダイアログが開かれる。「接続する」ボタンを押す。
* 「RLogin」ダイアログが開かれる。「信頼するホスト鍵のリストを更新しますか？」と表示されていることを確認し、「Yes」ボタンを押す。
* `vagrant@ubuntu:~$` と表示されることを確認する。

### （参考）sshコマンドによる仮想マシンへの接続

（MSYS2、Git Bash、Cygwinなどを想定）
sshコマンドで仮想マシンに接続する。

```bash
ssh vagrant@localhost -p 2222
```

### パッケージ更新

パッケージ情報を更新する。

```bash
sudo apt update                        # sudoでコマンドを実行する際、パスワードを聞かれる場合がある。
# [sudo] password for vagrant:         # vagrant と入力してEnterキーを押す。
```

パッケージを更新する。

```bash
sudo apt upgrade -y
```

### GRUB設定の変更

GRUBの設定ファイルを開く。

```bash
sudo vim /etc/default/grub
```

Ubuntu起動時のOS選択画面の待ち時間を2秒から1秒に変更する。

```diff
-GRUB_TIMEOUT=2
+GRUB_TIMEOUT=1
```

GRUBの設定ファイルの変更を反映する。

```bash
sudo update-grub
```

### rootユーザパスワードの設定

rootユーザのパスワードを設定する。

```bash
sudo passwd root
# Enter new UNIX password:              # vagrant と入力
# Retype new UNIX password:             # vagrant と再度入力
# passwd: password updated successfully
```

パスワードがvagrantになったことを確認するため、rootユーザに切り替える。

```bash
su root
# Password:                             # vagrant と入力
```

vagrantユーザに戻る。

```bash
exit
```

### sudoersの設定

sudoコマンドの設定ファイルを開く。

```bash
sudo visudo
```

sudoがパスワード入力を求めないように設定する。

```diff
# Allow members of group sudo to execute any command
-%sudo   ALL=(ALL:ALL) ALL
+%sudo   ALL=(ALL) NOPASSWD:ALL
```

ログアウトし、接続を切断する。

```bash
exit
```

仮想マシンに再接続する。パスワードなしにsudoできることを確認する。

```bash
sudo ls                                 # 設定が間違っている場合、パスワードを要求される。
```

### sshdの設定

公開鍵を作成する。

```bash  
mkdir -m 700 ~/.ssh
echo "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key" > ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
```

SSHDの設定ファイルを開く。

```bash
sudo vim /etc/ssh/sshd_config
```

パスワードでrootログインできるようにする。

```diff
-PermitRootLogin prohibit-password
+PermitRootLogin yes
```

### VirtualBox Guest Additionsのインストール

* 仮想マシンのウインドウを選択する。
* 「デバイス」「Guest Additions CDイメージの挿入…」メニューを選択する。

```bash
sudo mount -t iso9660 /dev/sr0 /mnt
sudo apt install dkms build-essential
sudo sh /mnt/VBoxLinuxAdditions.run
```

参考：アンインストール

```bash
sudo /opt/VBoxGuestAdditions-5.0.30/uninstall.sh
```

参考：パッケージマネージャで直接インストール

```bash
sudo apt install virtualbox-guest-dkms
```

### 片付け

不要パッケージを削除する。

```bash
sudo apt autoremove
```

電源を切る

```bash
sudo shutdown -h 0
```

## Vagrant Package作成、登録

Windows PowerShellを開く。

```cmd
vagrant package --base tsurami/xenial64 --output tsurami_xenial64.box
vagrant box add --name tsurami/xenial64 tsurami_xenial64.box
```

## （参考）Vagrant Package削除

```cmd
vagrant box remove tsurami/xenial64
```
