<?php
require 'db.php';
session_start();

$user_id = $_SESSION['user_id'];

$stmt = $conn->prepare("SELECT * FROM Candidate WHERE candidate_id = ?");
$stmt->execute([$user_id]);
$candidate = $stmt->fetch();

$exp = $conn->prepare("SELECT * FROM Experience WHERE candidate_id = ?");
$exp->execute([$user_id]);
$experiences = $exp->fetchAll();

$skills = $conn->prepare("SELECT skill_name FROM Skill WHERE candidate_id = ?");
$skills->execute([$user_id]);
$skills = $skills->fetchAll(PDO::FETCH_COLUMN);

$projects = $conn->prepare("SELECT * FROM Project WHERE candidate_id = ?");
$projects->execute([$user_id]);
$projects = $projects->fetchAll();

$project_techs = [];
foreach ($projects as $project) {
    $pid = $project['project_id'];
    $stmt = $conn->prepare("SELECT tech_name FROM TechStack WHERE project_id = ?");
    $stmt->execute([$pid]);
    $project_techs[$pid] = $stmt->fetchAll(PDO::FETCH_COLUMN);
}

$langs = $conn->prepare("SELECT language FROM Language WHERE candidate_id = ?");
$langs->execute([$user_id]);
$languages = $langs->fetchAll(PDO::FETCH_COLUMN);

$courses = $conn->prepare("SELECT course_name FROM Course WHERE candidate_id = ?");
$courses->execute([$user_id]);
$courses = $courses->fetchAll(PDO::FETCH_COLUMN);

$certs = $conn->prepare("SELECT title, issuer FROM Certification WHERE candidate_id = ?");
$certs->execute([$user_id]);
$certifications = $certs->fetchAll();

$strs = $conn->prepare("SELECT strength FROM Strength WHERE candidate_id = ?");
$strs->execute([$user_id]);
$strengths = $strs->fetchAll(PDO::FETCH_COLUMN);

$hobs = $conn->prepare("SELECT hobby FROM Hobby WHERE candidate_id = ?");
$hobs->execute([$user_id]);
$hobbies = $hobs->fetchAll(PDO::FETCH_COLUMN);
?>
<!DOCTYPE html>
<html>
<head>
    <title>Resume - Double Column</title>
    <style>
        body { font-family: Arial; margin: 40px; background: #f4f4f4; }
        .container { display: flex; gap: 30px; }
        .left, .right { width: 50%; }
        h1, h2 { border-bottom: 1px solid #ccc; }
        .section { margin-bottom: 20px; }
        ul { padding-left: 20px; }
        p, li { line-height: 1.5; }
    </style>
</head>
<body>
    <h1><?= htmlspecialchars($candidate['name']) ?>'s Resume</h1>
    <p><strong>Email:</strong> <?= htmlspecialchars($candidate['email']) ?></p>
    <p><strong>DOB:</strong> <?= htmlspecialchars($candidate['DOB']) ?></p>
    <p><strong>Phone:</strong> <?= htmlspecialchars($candidate['phone_number']) ?></p>
    <p><strong>College:</strong> <?= htmlspecialchars($candidate['college_name']) ?></p>
    <p><strong>CGPA:</strong> <?= htmlspecialchars($candidate['CGPA']) ?> | <strong>Year:</strong> <?= htmlspecialchars($candidate['year_of_study']) ?></p>

    <div class="container">
        <div class="left">
            <div class="section">
                <h2>Experience</h2>
                <ul>
                    <?php foreach ($experiences as $e): ?>
                        <li><strong><?= htmlspecialchars($e['company_name']) ?></strong> - <?= htmlspecialchars($e['role']) ?> (<?= htmlspecialchars($e['duration']) ?>)<br><?= htmlspecialchars($e['description']) ?></li>
                    <?php endforeach; ?>
                </ul>
            </div>

            <div class="section">
                <h2>Projects</h2>
                <?php foreach ($projects as $p): ?>
                    <p><strong><?= htmlspecialchars($p['project_name']) ?></strong><br>
                    <?= htmlspecialchars($p['description']) ?><br>
                    <em>Tech Stack:</em> <?= htmlspecialchars(implode(', ', $project_techs[$p['project_id']] ?? [])) ?></p>
                <?php endforeach; ?>
            </div>

            <div class="section">
                <h2>Certifications</h2>
                <ul>
                    <?php foreach ($certifications as $cert): ?>
                        <li><?= htmlspecialchars($cert['title']) ?> - <?= htmlspecialchars($cert['issuer']) ?></li>
                    <?php endforeach; ?>
                </ul>
            </div>
        </div>

        <div class="right">
            <div class="section">
                <h2>Skills</h2>
                <ul>
                    <?php foreach ($skills as $skill): ?>
                        <li><?= htmlspecialchars($skill) ?></li>
                    <?php endforeach; ?>
                </ul>
            </div>

            <div class="section">
                <h2>Languages</h2>
                <ul>
                    <?php foreach ($languages as $lang): ?>
                        <li><?= htmlspecialchars($lang) ?></li>
                    <?php endforeach; ?>
                </ul>
            </div>

            <div class="section">
                <h2>Courses</h2>
                <ul>
                    <?php foreach ($courses as $course): ?>
                        <li><?= htmlspecialchars($course) ?></li>
                    <?php endforeach; ?>
                </ul>
            </div>

            <div class="section">
                <h2>Strengths</h2>
                <ul>
                    <?php foreach ($strengths as $str): ?>
                        <li><?= htmlspecialchars($str) ?></li>
                    <?php endforeach; ?>
                </ul>
            </div>

            <div class="section">
                <h2>Hobbies</h2>
                <ul>
                    <?php foreach ($hobbies as $hobby): ?>
                        <li><?= htmlspecialchars($hobby) ?></li>
                    <?php endforeach; ?>
                </ul>
            </div>
        </div>
    </div>
</body>
</html>
