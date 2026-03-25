<?php
require 'db.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    try {
        $conn->beginTransaction();
       session_start();
$user_id = $_SESSION['user_id'];
        $stmt = $conn->prepare("INSERT INTO Candidate (candidate_id, name, email, DOB, phone_number, college_name, CGPA, year_of_study)
                                VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
        $stmt->execute([
            $user_id,
            $_POST['name'],
            $_POST['email'],
            $_POST['dob'],
            $_POST['phone'],
            $_POST['college'],
            $_POST['cgpa'],
            $_POST['year']
        ]);
        $stmt = $conn->prepare("INSERT INTO Experience (candidate_id, company_name, role, duration, description) VALUES (?, ?, ?, ?, ?)");
        foreach ($_POST['company'] as $i => $company) {
            $stmt->execute([
                $user_id,
                $company,
                $_POST['role'][$i],
                $_POST['duration'][$i],
                $_POST['exp_description'][$i]
            ]);
        }
        $stmt = $conn->prepare("INSERT INTO Skill (candidate_id, skill_name) VALUES (?, ?)");
        foreach ($_POST['skill'] as $skill) {
            $stmt->execute([$user_id, $skill]);
        }
        $stmt = $conn->prepare("INSERT INTO Project (candidate_id, project_name, description) VALUES (?, ?, ?)");
        foreach ($_POST['project_name'] as $i => $pname) {
            $stmt->execute([$user_id, $pname, $_POST['project_desc'][$i]]);
            $project_id = $conn->lastInsertId();

            if (!empty($_POST['tech_stack'][$i])) {
                $techs = explode(',', $_POST['tech_stack'][$i]);
                $stmt2 = $conn->prepare("INSERT INTO TechStack (project_id, tech_name) VALUES (?, ?)");
                foreach ($techs as $tech) {
                    $stmt2->execute([$project_id, trim($tech)]);
                }
            }
        }
        $stmt = $conn->prepare("INSERT INTO Language (candidate_id, language) VALUES (?, ?)");
        foreach ($_POST['language'] as $lang) {
            $stmt->execute([$user_id, $lang]);
        }
        $stmt = $conn->prepare("INSERT INTO Course (candidate_id, course_name) VALUES (?, ?)");
        foreach ($_POST['course'] as $course) {
            $stmt->execute([$user_id, $course]);
        }
        $stmt = $conn->prepare("INSERT INTO Certification (candidate_id, title, issuer) VALUES (?, ?, ?)");
        foreach ($_POST['cert_title'] as $i => $title) {
            $issuer = $_POST['cert_issuer'][$i];
            $stmt->execute([$user_id, $title, $issuer]);
        }
        $stmt = $conn->prepare("INSERT INTO Strength (candidate_id, strength) VALUES (?, ?)");
        foreach ($_POST['strength'] as $str) {
            $stmt->execute([$user_id, $str]);
        }
        $stmt = $conn->prepare("INSERT INTO Hobby (candidate_id, hobby) VALUES (?, ?)");
        foreach ($_POST['hobby'] as $hobby) {
            $stmt->execute([$user_id, $hobby]);
        }
        $conn->commit();
        echo "<h3>Candidate profile created successfully!</h3>";
echo '<a href="dashboard.php"><button>Go to Dashboard</button></a>';
    } catch (Exception $e) {
        $conn->rollBack();
        echo "Error: " . $e->getMessage();
    }
}
?>
<style>
    input, textarea { margin: 4px; display: block; }
    .section { border: 1px solid #ccc; padding: 10px; margin: 10px 0; }
</style>

<h2>Candidate Profile Form</h2>
<form method="POST">
    <div class="section">
        <h3>Basic Info</h3>
        Name: <input type="text" name="name" required>
        Email: <input type="email" name="email" required>
        DOB: <input type="date" name="dob" required>
        Phone: <input type="text" name="phone">
        College: <input type="text" name="college">
        CGPA: <input type="text" name="cgpa">
        Year: <input type="number" name="year">
    </div>

    <div class="section" id="experience-section">
        <h3>Experience <button type="button" onclick="addExperience()">+</button></h3>
        <div>
            Company: <input type="text" name="company[]">
            Role: <input type="text" name="role[]">
            Duration: <input type="text" name="duration[]">
            Description: <textarea name="exp_description[]"></textarea>
        </div>
    </div>

    <div class="section" id="skill-section">
        <h3>Skills <button type="button" onclick="addSkill()">+</button></h3>
        <div>
            Skill: <input type="text" name="skill[]">
        </div>
    </div>

    <div class="section" id="project-section">
        <h3>Projects <button type="button" onclick="addProject()">+</button></h3>
        <div>
            Project Name: <input type="text" name="project_name[]">
            Description: <textarea name="project_desc[]"></textarea>
            Tech Stack (comma-separated): <input type="text" name="tech_stack[]">
        </div>
    </div>

    <div class="section" id="language-section">
        <h3>Languages <button type="button" onclick="addSimpleField('language')">+</button></h3>
        <input type="text" name="language[]">
    </div>
    <div class="section" id="certification-section">
    <h3>Certifications <button type="button" onclick="addCertification()">+</button></h3>
    <div>
        Title: <input type="text" name="cert_title[]">
        Issuer: <input type="text" name="cert_issuer[]">
        </div>
    </div>

    <div class="section" id="course-section">
        <h3>Courses <button type="button" onclick="addSimpleField('course')">+</button></h3>
        <input type="text" name="course[]">
    </div>

    <div class="section" id="strength-section">
        <h3>Strengths <button type="button" onclick="addSimpleField('strength')">+</button></h3>
        <input type="text" name="strength[]">
    </div>

    <div class="section" id="hobby-section">
        <h3>Hobbies <button type="button" onclick="addSimpleField('hobby')">+</button></h3>
        <input type="text" name="hobby[]">
    </div>

    <button type="submit">Submit</button>
</form>

<script>
function addExperience() {
    let div = document.createElement("div");
    div.innerHTML = `
        Company: <input type="text" name="company[]">
        Role: <input type="text" name="role[]">
        Duration: <input type="text" name="duration[]">
        Description: <textarea name="exp_description[]"></textarea>
    `;
    document.getElementById("experience-section").appendChild(div);
}

function addSkill() {
    let div = document.createElement("div");
    div.innerHTML = `Skill: <input type="text" name="skill[]">`;
    document.getElementById("skill-section").appendChild(div);
}

function addProject() {
    let div = document.createElement("div");
    div.innerHTML = `
        Project Name: <input type="text" name="project_name[]">
        Description: <textarea name="project_desc[]"></textarea>
        Tech Stack (comma-separated): <input type="text" name="tech_stack[]">
    `;
    document.getElementById("project-section").appendChild(div);
}
function addCertification() {
    let div = document.createElement("div");
    div.innerHTML = `
        Title: <input type="text" name="cert_title[]">
        Issuer: <input type="text" name="cert_issuer[]">
    `;
    document.getElementById("certification-section").appendChild(div);
}

function addSimpleField(field) {
    let input = document.createElement("input");
    input.type = "text";
    input.name = field + "[]";
    document.getElementById(field + "-section").appendChild(input);
}
</script>
