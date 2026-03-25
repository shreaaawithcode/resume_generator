<?php
session_start();
if (!isset($_SESSION['user_name'])) {
    header("Location: login.php");
    exit;
}
?>
<h2>Welcome, <?php echo htmlspecialchars($_SESSION['user_name']); ?>!</h2>
<p>This is your dashboard.</p>
<form action="candidate_profile.php" method="get">
    <input type="submit" value="Add Details">
</form>
<select id="resumeOption">
  <option value="" disabled selected>Select Resume Type</option>
  <option value="resume_single.php">Single Column</option>
  <option value="resume_double.php">Double Column</option>
</select>
<button onclick="viewResume()">View</button><br>
<script>
  function viewResume() {
    const selectedValue = document.getElementById("resumeOption").value;
    if (selectedValue) {
      window.location.href = selectedValue;
    } else {
      alert("Please select a resume type.");
    }
  }
</script>
<button><a href="logout.php">Logout</a></button>
