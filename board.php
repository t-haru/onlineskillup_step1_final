<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>掲示板</title>
    <link rel = "stylesheet" href = "/board.css" type = "text/css">
  </head>
  <body>
    <h1> 掲示板 </h1>

    <?php
    //サーバーに接続
    if($_SERVER['SERVER_NAME'] == "localhost") {
      //ローカルの接続設定
	    $mysqli = new mysqli('localhost', 'root', '', 'board');
      //エラーが発生した場合
      if ($mysqli->connect_error){
        print("接続失敗：" . $mysqli->connect_error);
        exit();
      }
    } else {
      //XREAサーバの接続設定
      $mysqli = new mysqli('localhost', 'onlineskillup', 'pass', 'onlineskillup');
      //エラーが発生した場合
      if ($mysqli->connect_error){
        print("接続失敗：" . $mysqli->connect_error);
        exit();
        }
      }
    ?>

    <form method="POST" action="board.php">
    <p>名前：<br><input type = "text" name = "name" /></p>
    <p>本文：<br><textarea name = "message" rows = "3" /></textarea>
    <p>文字色：<input type = "color" name = "color" list = "color"></p>

    <datalist id = "color">
      <option value = "#000000"></option>
      <option value = "#ff0000"></option>
      <option value = "#0000ff"></option>
    </datalist>

    <p><input type = "submit" value = "送信" />
    <input type = "reset" value = "リセット" /></p>
    </form>
    <hr>
    <?php
    //プリペアドステートメントを作成
    //ユーザ入力を使用する箇所は?にしておく
    $stmt = $mysqli->prepare("INSERT INTO board (name, message, color) VALUES (?, ?, ?)");
    //$_POST["name"]に名前，$_POST["message"]に本文が格納
    //?の位置に値を割り当てる
    $stmt->bind_param('sss', $_POST["name"], $_POST["message"], $_POST["color"]);
    //実行
    $stmt->execute();

    //datasテーブルから日付の降順でデータを取得
    $result = $mysqli->query("SELECT * FROM board ORDER BY created DESC");
    if($result){
      //1行ずつ取り出す
      while($row = $result->fetch_object()){
        //htmlタグが入力された場合はエスケープ
        $name = htmlspecialchars($row->name);
        $message = htmlspecialchars($row->message);
        $message = nl2br($message);     //本文の改行コードを<br/>タグへ変換
        $created = htmlspecialchars($row->created);
        $color = htmlspecialchars($row->color);
        //表示
    ?><font class = "position" color = "<?php print("$color"); ?>"> <?php
        print("$name : ($created)<br> $message <br>");
        ?></font><?php
      }
    }
    //接続を切る
    $mysqli->close();
    ?>
  </body>
</html>
