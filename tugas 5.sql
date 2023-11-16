<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contoh GUI PHP</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin: 50px;
        }
        form {
            display: inline-block;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
        }
        input[type="text"], input[type="submit"] {
            padding: 10px;
            margin: 5px;
        }
    </style>
</head>
<body>

<?php
// Memproses data jika formulir dikirim
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nama = htmlspecialchars($_POST["nama"]);
    echo "<p>Halo, $nama! Selamat datang.</p>";
}
?>

<!-- Formulir GUI PHP -->
<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
    <label for="nama">Masukkan Nama:</label>
    <input type="text" id="nama" name="nama" required>
    <br>
    <input type="submit" value="Submit">
</form>

</body>
</html>