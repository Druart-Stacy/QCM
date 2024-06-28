<?php
// Paramètres de connexion à la base de données
$serveur = "localhost";
$utilisateur = "root";
$motdepasse = "root";
$basededonnees = "qcmprogramation";

// Connexion à la base de données
$connexion = new mysqli($serveur, $utilisateur, $motdepasse, $basededonnees);

// Vérifier la connexion
if ($connexion->connect_error) {
    die("Connexion échouée : " . $connexion->connect_error);
}

// Requête SQL pour récupérer les questions avec leurs réponses
$requete = "SELECT q.id_question, q.question, r.id_reponse, r.reponse, r.choix
            FROM questions q
            INNER JOIN reponses r ON q.id_question = r.id_question
            ORDER BY q.id_question, r.id_reponse";

$resultat = $connexion->query($requete);

if ($resultat->num_rows > 0) {
    $questions = array(); // Tableau pour stocker les questions avec leurs réponses

    // Parcourir les résultats et organiser les questions avec leurs réponses
    while ($row = $resultat->fetch_assoc()) {
        $id_question = $row['id_question'];

        // Si la question n'a pas encore été ajoutée au tableau, l'ajouter
        if (!isset($questions[$id_question])) {
            $questions[$id_question] = array(
                'question' => $row['question'],
                'reponses' => array()
            );
        }

        // Ajouter la réponse à la liste des réponses de la question
        $questions[$id_question]['reponses'][] = array(
            'id_reponse' => $row['id_reponse'],
            'reponse' => $row['reponse'],
            'choix' => $row['choix']
        );
    }

    // Afficher les questions avec leurs réponses
    foreach ($questions as $id_question => $info_question) {
        echo "<p><strong>Question :</strong> " . $info_question['question'] . "</p>";
        echo "<ul>";
        foreach ($info_question['reponses'] as $reponse) {
            echo "<li>";
            echo $reponse['reponse'];
            if ($reponse['choix']) {
                echo " (Correcte)";
            }
            echo "</li>";
        }
        echo "</ul>";
    }
} else {
    echo "Aucune question trouvée.";
}

// Fermer la connexion à la base de données
$connexion->close();
?>
