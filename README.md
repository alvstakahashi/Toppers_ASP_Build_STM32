# Toppers_ASP_Build_STM32
What is this? 概要<br>
TOPPERS学習ボード用に開発環境を手軽に設定できるものです。<br>
ビルドするための手順をDockerで記載しました。<br>
dockerビルドするだけで、環境構築もカーネルのビルドも完了します。<br>
また、そのあとの手順でVSCodeと連携する手順も記載しております。<br>

仕様<br>
対象ボード　STM32F401RE nucleo-64  (CortexM4Fになります。)<br>
対象TOPPERSカーネル　TOPPERS/ASP<br>
コンテナで動作するOS　ubuntu x86_64 <br>
利用可能なツール　arm tool chain および　st-flash<br>
toppersjp/armgcc-ubuntu:7-2018-q2　をベースにしています。<br>
開発環境のみは以下のDockerイメージになります。<br>
https://hub.docker.com/r/alvstakahashi/stm32toolchain <br>

環境の前提条件<br>
Windows10 64bit Docker Desktop インストール済み<br>
Visual Stidio Code に　remote コンテナ機能一式インストール済み

上記までの手順はこちらの２つの資料を確認ください。<br>
https://github.com/alvstakahashi/TOPPERS_SSP_shrink_V850_For_athrill <br>
Athrill 実行環境事前設定の説明.docx<br>
VSCodeを利用した仮想化リアルタイムOS実演.pptx<br>

利用手順<br>
1.Dockerビルドします。<br>
　本gitのルートのDockerfileが置かれたディレクトリで以下を実行します。<br>
　powershell で実行します。<br>
　
　ps> docker build -t aspbuild .  <br>
　
　以上で　TOPPERS/ASPのビルドが終わりました。<br>
2.ビルドの終わった環境を確認する。<br>
　同じく　powershellで以下を実行します。<br>
　本gitのルートの.devcontainer が置かれたディレクトリで以下を実行します。<br>
　>docker run -it --rm -v ${PWD}:/source aspbuild   <br>
　
　実行するとシェルが立ち上がっています。<br>
　root@e25ce2665f1b:/home/toppers#  <br>

　ビルドファイルの確認します <br>
　
　root@e25ce2665f1b:/home/toppers# ls asp/OBJ<br>
　
　.oファイル　aspファイルなどが表示されればOKです。 <br>

3.VSCodeでの環境設定<br>
　簡易開発環境として、VScodeで編集ビルドできる設定を引き続き行います。<br>
　コマンドでファイルコピーします。<br>
　
　root@e25ce2665f1b:/home/toppers# cp -r asp/* /source/. <br>
　
　以上コピーできたら　exitで　dockerを終了します。<br>

4.VSCodeでの読み込み<br>
　VScode で　左下　緑をクリックするとプルダウンがでてくるので<br>
　Open Folder in Container.. を選びます<br>
　本gitのルートの.devcontainer が置かれたディレクトリを<br>
　指定(.devcontainerではなく、その上です)します。<br>
  詳しい手順は以下を参照ください。ほぼ同様です。<br>
　「VSCodeを利用した仮想化リアルタイムOS実演.pptx」<br>
　立ち上がって、ターミナルを起動して、ls OBJ で確認できればOKです。<br>
  VScode,JPGのようになればOKです。<br>

実装仕様(下名が作成時の苦労した点)<br>
1.正式なビルド環境を作りたかった<br>
　toppersjp/armgcc-ubuntu:7-2018-q2　ベースにすることにした。<br>

2.64bit　linux なので 32bitバイナリの実行環境設定<br>
　コンフィギュレータを 32bitバイナリ利用のための設定<br>

3.st-flash のインストール<br>
　なぜかcmake でかなり苦労しました。

4.VSCodeの連携<br>
　V850 athrillと同じ感じにしました。<br>

謝辞<br>
以下のサイトを丸写しではなく大変参考にさせていただきました。<br>
ありがとうございます。<br>

GitlabとDockerでTOPPERSカーネルのデイリービルドを作ろう<br>
https://qiita.com/mitsu48/items/24acba99c9dd38ad5b43<br>
@mitsu48(TOPPERSプロジェクト)　様<br>

STM32CubeIDEでTOPPERS/ASPカーネルを動かす - 準備編<br>
https://qiita.com/imagou/items/8e19ed77884af4fb4e71<br>
@imagou　様<br>

TOPPERS/ASPカーネルビルド用のDockerfile<br>
https://qiita.com/AckyFc3/items/d7d1c7e01285c51f6649<br>
@AckyFc3　様<br>

https://hub.docker.com/r/toppersjp/armgcc-ubuntu<br>
toppersプロジェクトの皆さま<br>
以上
