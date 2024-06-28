<?php // Configuration des paramètres de connexion
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "qcmprogramation";

try {
    // Créer une instance de PDO
    $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    // Configurer PDO pour lancer des exceptions en cas d'erreur
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo "Échec de la connexion : " . $e->getMessage();
    die();
}

// Récupérer les questions de la base de données
try {
    $stmt = $conn->prepare("SELECT id, question, correct_answer FROM questions");
    $stmt->execute();
    $questions = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    echo "Erreur : " . $e->getMessage();
    die();
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>Formulaire de questions</title>
    <style>
@import url('https://fonts.googleapis.com/css2?family=Press+Start+2P&display=swap');
</style>
    <link rel="stylesheet" href="sass/style.css">
    
</head>
<body>
    <div class="container"></div>
    <h1>Formulaire de questions</h1>
    <form class="formulaire" action="submit_form.php" method="post">
    <?php foreach ($questions as $question): ?>
        <label for="question_<?php echo $question['id']; ?>"><?php echo htmlspecialchars($question['question']); ?></label><br>
        <input type="text" id="question_<?php echo $question['id']; ?>" name="answers[<?php echo $question['id']; ?>]" required><br><br>
    <?php endforeach; ?>
    <input type="submit" value="Soumettre">
</form>
</body>
</html>