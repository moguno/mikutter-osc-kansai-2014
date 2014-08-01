# coding: UTF-8

Plugin.create(:mikutter_osc) {
  PLACE_TABLE = {
    :SC => "１号館４Ｆ サイエンスホール",
    :AV => "１号館４Ｆ AV会議室",
    :A => "１号館４Ｆ 会議室Ａ",
    :B => "１号館４Ｆ 会議室Ｂ",
    :C => "１号館４Ｆ 会議室Ｃ",
    :INV => "KISTIC２Ｆ イノベーションルーム",
    :OS => "アトリウム１Ｆ オープンスペース",
  }

  TIME_TABLE = {
    :_1_10 => [Time.parse("14/08/01 10:00:00"), Time.parse("14/08/01 10:45:00")],
    :_1_11 => [Time.parse("14/08/01 11:00:00"), Time.parse("14/08/01 11:45:00")],
    :_1_12 => [Time.parse("14/08/01 12:00:00"), Time.parse("14/08/01 12:45:00")],
    :_1_13 => [Time.parse("14/08/01 13:00:00"), Time.parse("14/08/01 13:45:00")],
    :_1_14 => [Time.parse("14/08/01 14:00:00"), Time.parse("14/08/01 14:45:00")],
    :_1_15 => [Time.parse("14/08/01 15:15:00"), Time.parse("14/08/01 16:00:00")],
    :_1_16 => [Time.parse("14/08/01 16:15:00"), Time.parse("14/08/01 17:00:00")],

    :_2_10 => [Time.parse("14/08/02 10:00:00"), Time.parse("14/08/02 10:45:00")],
    :_2_11 => [Time.parse("14/08/02 11:00:00"), Time.parse("14/08/02 11:45:00")],
    :_2_12 => [Time.parse("14/08/02 12:00:00"), Time.parse("14/08/02 12:45:00")],
    :_2_13 => [Time.parse("14/08/02 13:00:00"), Time.parse("14/08/02 13:45:00")],
    :_2_14 => [Time.parse("14/08/02 14:00:00"), Time.parse("14/08/02 14:45:00")],
    :_2_15 => [Time.parse("14/08/02 15:15:00"), Time.parse("14/08/02 16:00:00")],
    :_2_16 => [Time.parse("14/08/02 16:15:00"), Time.parse("14/08/02 17:30:00")],
  }

  Seminor = Struct.new(:time, :place, :subject)

  SEMINORS = [
    Seminor.new(:_1_10, :SC, "OpenStackで始めるクラウド環境構築入門"),
    Seminor.new(:_1_10, :AV, "OSSライセンスの基礎～OSSの機能を組み合わせて、すばらしい機能を実現したとしてもライセンスが両立できなければ、販売(頒布)できません(GPLの両立性の問題)"),

    Seminor.new(:_1_11, :SC, "DevOpsを実践する為のChef活用テクニック"),
    Seminor.new(:_1_11, :AV, "統合バックアップBaculaを使ってみよう"),
    Seminor.new(:_1_11, :A, "AMDが推進するHSA(OpenCL)やARMやAPU製品、GPU製品の最新の開発状況を京都の皆様にお届け！"),

    Seminor.new(:_1_12, :SC, "ライトニングトーク（by OSCスポンサー）"),

    Seminor.new(:_1_13, :SC, "できるOpenStack 構築編 ～ ね？簡単でしょう？ ～"),
    Seminor.new(:_1_13, :AV, "【入門】PostgreSQL + Pacemaker + DRBD で高可用性構成を構築してみよう"),
    Seminor.new(:_1_13, :A, "Ruby/Rails/mongoDBで動作する中・大規模サイト向けCMS「シラサギ」のご紹介～Webアプリ開発プラットフォームとしての利用も可能！～"),
    Seminor.new(:_1_13, :C, "欧州の研究開発クラウドの最新動向"),

    Seminor.new(:_1_14, :SC, "監視もジョブも、クラウド管理も「Hinemos」で ～監視・ジョブ機能を併せ持つ唯一のOSS「Hinemos」のご紹介～"),
    Seminor.new(:_1_14, :AV, "PHP, Node.js 開発者のための Microsoft Azure 使い倒し講座"),
    Seminor.new(:_1_14, :A, "Oracle Database ユーザのためのPostgreSQL入門"),
    Seminor.new(:_1_14, :B, "WebアプリケーションサーバJBoss入門 ～ビジネスの変化に対応するルールエンジンのメリット～"),
    Seminor.new(:_1_14, :C, "より良いクラウドのソフトウェア開発とは？ －欧州での事例紹介－"),

    Seminor.new(:_1_15, :SC, "手作業なしの安定環境実現に向けたZabbix活用方法紹介+Zabbix2.4最新機能紹介"),
    Seminor.new(:_1_15, :AV, "ownCloudで構築する大規模オンラインストレージ"),
    Seminor.new(:_1_15, :A, "OpenContrailでネットワーク仮想化とNFV"),
    Seminor.new(:_1_15, :B, "SDカードで無線Lチカ？FlashAirは超ミニマイコン！★アイデアコンテストも実施中"),
    Seminor.new(:_1_15, :C, "構成変更ツールDRBL-Winrollを使ってWindowsを大量展開しよう"),

    Seminor.new(:_1_16, :SC, "SQLとプロシージャからみたRDBMSの違い（Oracle、PostgreSQL/Postgres Plus、MySQL/MariaDB）"),
    Seminor.new(:_1_16, :AV, "実績多数のクラウド基盤OSS、CloudStackによるIaaSクラウドの作りかた"),
    Seminor.new(:_1_16, :A, "DDNのクラウドストレージプラットフォームへの取り組み　～導入事例を交えて～"),
    Seminor.new(:_1_16, :B, "自治体、大学向けのWEB開発と運用について"),
    Seminor.new(:_1_16, :C, "NetBSDのご紹介"),

    Seminor.new(:_2_10, :SC, "業務アプリケーションにおけるこれからのWeb開発"),
    Seminor.new(:_2_10, :AV, "OSSコンソーシアム活動の紹介"),
    Seminor.new(:_2_10, :A, "オープンデータ可視化もオープンソースGISで超簡単！"),
    Seminor.new(:_2_10, :B, "新しい生活をLinuxといっしょに始めよう！"),
    Seminor.new(:_2_10, :C, "NetwalkerとARM　Linuxカスタマイズ情報"),
    Seminor.new(:_2_10, :INV, "Drupalハンズオン!～初めての人も歓迎! ローカルでDrupalを動かしてみよう"),
    Seminor.new(:_2_10, :OS, "灘校パソコン研究部 LT"),

    Seminor.new(:_2_11, :SC, "NetCommonsで一から作る簡単サイト構築術、 及び担当者が語る研究機関でのグループウェアとしての運用・使用事例"),
    Seminor.new(:_2_11, :AV, "OSSによるクラウドオーケストレーションに迫る！(オープンクラウドキャンパス クラウド運用管理研究会)"),
    Seminor.new(:_2_11, :A, "Pacemaker + PostgreSQLレプリケーション構成(PG-REX)のフェイルオーバー高速化"),
    Seminor.new(:_2_11, :B, "これからMySQLを始めようとする人のための第一歩"),
    Seminor.new(:_2_11, :C, "Debian Project の最近の動向について"),
    Seminor.new(:_2_11, :INV, "LibreOffice ～コミュニティの最新動向と新バージョン4.3について～"),
    Seminor.new(:_2_11, :OS, "東海道らぐの夏祭り！ライトニングトークBoF大会"),

    Seminor.new(:_2_12, :SC, "Apache CloudStack概要"),
    Seminor.new(:_2_12, :AV, "OSS研究動向セミナー"),
    Seminor.new(:_2_12, :A, "開発者と行政をつなぐ「Code forJapan」の説明と『Code for KINKI』立上げに関して・活動報告"),
    Seminor.new(:_2_12, :B, "大きく進化する次のconcrete5バージョン5.7のご紹介"),
    Seminor.new(:_2_12, :C, "Vine Linux の最新動向―次期安定版 Vine Linux 7 [Ausone] プレビュー版の紹介―"),
    Seminor.new(:_2_12, :INV, "DNS初めの一歩とダイナミックDNSの今＆GVCによるオープンハード・オープンソースでの遠隔操作の紹介"),
    Seminor.new(:_2_12, :OS, "はじめまして、オープンソース！ ～オープンソース／フリーカルチャーを楽しもう～"),

    Seminor.new(:_2_13, :SC, "「物足りない」を解決する。新世代クラウドサービス「IBM Softlayer」を徹底解説"),
    Seminor.new(:_2_13, :AV, "ロケットや自動車にも搭載！高品質な組込み向けオープンソースを開発するTOPPERSプロジェクトのご紹介"),
    Seminor.new(:_2_13, :A, "Ruby PaaS MOGOKの進化とLinuxコンテナ"),
    Seminor.new(:_2_13, :B, "手軽に買える機器をハックして、 メーカが提供している以上の機能、性能を引き出そう！！"),
    Seminor.new(:_2_13, :C, "PostgreSQLの最新動向(PostgreSQL9.4他)"),
    Seminor.new(:_2_13, :INV, "baserCMSのエコシステムが目指すもの"),
    Seminor.new(:_2_13, :OS, "mikutter 3.0"),

    Seminor.new(:_2_14, :SC, "豪華2本立て「オープンソース超入門」と「ソフトウェア開発でOSSを利用する最適な手法と課題」"),
    Seminor.new(:_2_14, :AV, "Linux技術者認定資格(LPIC) レベル1技術解説セミナー"),
    Seminor.new(:_2_14, :A, "NTTデータにおける Apche Spark への取り組み"),
    Seminor.new(:_2_14, :B, "jus研究会京都大会「みんなで作ろうオープンデータ in 京都」"),
    Seminor.new(:_2_14, :C, "Contao Open Source CMSの最新動向 ～ リリース3.3"),
    Seminor.new(:_2_14, :INV, "クラウドOS「OSv」のご紹介"),
    Seminor.new(:_2_14, :OS, "Ubuntuなひととき"),

    Seminor.new(:_2_15, :SC, "あのサービスもさくら！？「さくらのクラウド」でサービスローンチしてみよう～京都編～"),
    Seminor.new(:_2_15, :AV, "複雑になるクラウドの運用をHatoholでまとめて手軽に！ ～運用統合管理ソフトHatoholのご紹介～"),
    Seminor.new(:_2_15, :A, "OpenStackの概要と最新動向"),
    Seminor.new(:_2_15, :B, "MongoDB基本の基本"),
    Seminor.new(:_2_15, :C, "秘密結社Metasepi作戦会議 – ATS言語を使った関数型マイコンプログラミング"),
    Seminor.new(:_2_15, :INV, "BI入門"),

    Seminor.new(:_2_16, :INV, "ライトニングトーク＆大抽選会＆閉会式-OSC2014Kansai@Kyoto"),
  ]


  class Looper
    attr_reader :stop

    def initialize
      @stop = false
    end

    def start(timer_set, &proc)
      proc.call

      interval = timer_set.call

      if !interval
        @stop = true
        return
      end

      Reserver.new(interval) { start(timer_set, &proc) }
    end
  end

 
  def get_next_seminor_time(time)
    result = TIME_TABLE.find { |key, semi_time|
      (semi_time[1] > time) && ( semi_time[0] > time )
    }

    if result
      result[0]
    else
      nil
    end
  end


  def make_msg_array(next_seminor_time, seminors)
    msg = []
    msg << "ぴんぽんぱんぽーん♪"
    msg << "次のセミナーのお知らせです。"
    msg << ""
    msg << "●●●#{TIME_TABLE[next_seminor_time][0].strftime("%H:%Mより")}●●●"

    msg += seminors.map { |sem|
      ["", "【#{PLACE_TABLE[sem.place]}】", "#{sem.subject}"]
    }.flatten

    msg
  end


  on_boot { |service|
    next_seminor_time = get_next_seminor_time(Time.now)

    seminors = SEMINORS.select { |sem|
      sem.time == next_seminor_time
    }

    if seminors
      msg = make_msg_array(next_seminor_time, seminors)

      timeline(:home_timeline) << Message.new(:message => msg.join("\n"), :system => true)

      Reserver.new(3) {
        Delayer.new {
          msg = [
            "こんな感じで開始15分前に次のセミナーをお知らせするね。",
            "",
            "情報は7/31時点のものだから、会場の最新情報も必ずチェックしてね。",
          ]

          timeline(:home_timeline) << Message.new(:message => msg.join("\n"), :system => true)
        }
      }


      Looper.new.start(-> {1 * 60 + 1}) {
        next_seminor_time = get_next_seminor_time(Time.now)

        seminors = SEMINORS.select { |sem|
          sem.time == next_seminor_time
        }

        if ((TIME_TABLE[next_seminor_time][0] - Time.now) <= (15 * 60)) && (@last_notified != next_seminor_time)
          @last_notified = next_seminor_time
          
          msg = make_msg_array(next_seminor_time, seminors)
          timeline(:home_timeline) << Message.new(:message => msg.join("\n"), :system => true)
        end
      }
    end
  }


  command(:notify_seminor, name: "次のセミナーは？", condition: lambda { |opt| true }, visible: true, icon: Skin.get("post.png"), role: :window) { |opt|
    next_seminor_time = get_next_seminor_time(Time.now)

    seminors = SEMINORS.select { |sem|
      sem.time == next_seminor_time
    }

    if seminors
      msg = make_msg_array(next_seminor_time, seminors)

      timeline(:home_timeline) << Message.new(:message => msg.join("\n"), :system => true)
    end
  }


  class Gdk::SubPartsFavToshi_a < Gdk::SubParts
    #regist

    def is_toshi_a?(message)
      message[:user][:screen_name] == "toshi_a"
    end

    def height
      if is_toshi_a?(helper.message)
        40
      else
        0
      end
    end

    @flag = false

    def render(context)
      if !is_toshi_a?(helper.message)
        return
      end

      width = context.clip_extents[2] * Pango::SCALE

      layout = context.create_pango_layout
      layout.width = width
      layout.wrap = Pango::WRAP_CHAR
      layout.text = "↑いまだ！ふぁぼれ！"
      font = Plugin.filtering(:message_font, layout.text, nil).last

      if font
        desc = Pango::FontDescription.new(font)
        desc.set_size(20 * Pango::SCALE)
        layout.font_description = desc
      end

      if @flag
        context.set_source_rgb(255 * 256, 0, 0)
      else
        context.set_source_rgb(255 * 256, 255 * 256, 0)
      end

      @flag = !@flag

      context.rectangle(0,0,width,height * Pango::SCALE)
      context.fill

      context.set_source_rgb(0, 0, 0)
      context.show_pango_layout(layout)

      if !@looper
        @times = 10
        @looper = Looper.new

        @looper.start(lambda {
          @times -= 1
          if @times <= 0
            nil
          else
            1
          end
        }) {
          Delayer.new(:ui_favorited) {
            helper.on_modify
          }
        }
      end
    end
  end


  command(:favxxx, name: "???", condition: lambda { |opt| true }, visible: true, icon: Skin.get("icon.png"), role: :window) { |opt|
    if Time.now > Time.parse("14/8/2 10:00")
      timeline(:home_timeline) << Message.new(:message => "さぁ、としぁさんを応援しよーーー！", :system => true)
      Gdk::SubPartsFavToshi_a.regist
    else
      timeline(:home_timeline) << Message.new(:message => "もうちょっと待ってね♪", :system => true)
    end
  }
}

