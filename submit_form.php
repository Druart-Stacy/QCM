<?php
// Inclure le fichier de connexion
include 'db_connection.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Récupérer les réponses du formulaire
    $user_answers = $_POST['answers'];

    // Récupérer les questions et les bonnes réponses de la base de données
    try {
        $stmt = $conn->prepare("SELECT id, question, correct_answer FROM questions");
        $stmt->execute();
        $questions = $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        echo "Erreur : " . $e->getMessage();
        die();
    }
    // Récupérer les réponse  et les bonnes réponses de la base de données
    try {
        $stmt = $conn->prepare("SELECT id_question, reponse FROM reponses");
        $stmt->execute();
        $questions = $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        echo "Erreur : " . $e->getMessage();
        die();
    }

    // Enregistrer les réponses des utilisateurs dans la base de données
    foreach ($user_answers as $question_id => $answer) {
        try {
            $stmt = $conn->prepare("INSERT INTO reponses (question_id, reponse_text, user_id) VALUES (:question_id, :reponse_text, :user_id)");
            $stmt->bindParam(':question_id', $question_id);
            $stmt->bindParam(':reponse_text', $answer);
            $stmt->bindParam(':user_id', $user_id); // Vous devez définir ou récupérer $user_id
            $stmt->execute();
        } catch (PDOException $e) {
            echo "Erreur : " . $e->getMessage();
        }
    }

    // Afficher les résultats
    ?>
    <!DOCTYPE html>
    <html>
    <head>
        <title>Résultats des questions</title>
        <style>
            .correct { color: green; }
            .incorrect { color: red; }
        </style>
    </head>
    <body>

    <h1>Résultats des questions</h1>
    <form>
        <?php
        foreach ($questions as $question) {
            $user_answer = isset($user_answers[$question['id']]) ? htmlspecialchars($user_answers[$question['id']]) : '';
            $correct_answer = htmlspecialchars($question['correct_answer']);
            $class = ($user_answer == $correct_answer) ? 'correct' : 'incorrect';
            ?>
            <label for="question_<?php echo $question['id']; ?>"><?php echo htmlspecialchars($question['question']); ?></label><br>
            <input type="text" id="question_<?php echo $question['id']; ?>" name="answers[<?php echo $question['id']; ?>]" value="<?php echo $user_answer; ?>" class="<?php echo $class; ?>" readonly><br>
            <span class="<?php echo $class; ?>"><?php echo $class == 'correct' ? 'Correct!' : 'Incorrect! La bonne réponse est: ' . $correct_answer; ?></span><br><br>
            <?php
        }
        ?>
    </form>

    </body>
    </html>
    <?php
}
?>
