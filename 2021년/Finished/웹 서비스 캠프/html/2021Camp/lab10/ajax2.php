<?php
    $no = $_POST['imagno'];
    if ($no == 1){
        $title = "재창";
        $img = "../img/jaechang.jpeg";
    }
    else{
        $title = "고양이";
        $img = "https://cdn.pixabay.com/photo/2020/11/10/01/34/pet-5728249_1280.jpg";

    }

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h2><?= $title ?></h2>
    <img src='<?= $img ?>' />
    
</body>
</html>


