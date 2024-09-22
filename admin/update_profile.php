<?php

include '../components/connect.php';

session_start();

$admin_id = $_SESSION['admin_id'];

if(!isset($admin_id)){
   header('location:admin_login.php');
   exit();
}

if(isset($_POST['submit'])){
   // Sanitize input
   $name = filter_var($_POST['name'], FILTER_SANITIZE_STRING);
   
   // Update profile name
   $update_profile_name = $conn->prepare("UPDATE `admins` SET name = ? WHERE id = ?");
   $update_profile_name->execute([$name, $admin_id]);

   // Retrieve form data for password change
   $empty_pass = 'da39a3ee5e6b4b0d3255bfef95601890afd80709';  // Default empty password hash
   $prev_pass = $_POST['prev_pass']; // Previous password in database
   $old_pass = $_POST['old_pass']; // Old password entered by admin
   $new_pass = $_POST['new_pass']; // New password entered by admin
   $confirm_pass = $_POST['confirm_pass']; // Confirmed new password

   $message = [];

   // Validation for password change
   if($old_pass == $empty_pass){
      $message[] = 'Please enter your old password!';
   } elseif($old_pass != $prev_pass) {
      $message[] = 'Old password is incorrect!';
   } elseif($new_pass != $confirm_pass) {
      $message[] = 'New password and confirm password do not match!';
   } else {
       // Ensure new password is not empty
       if ($new_pass != $empty_pass) {
           if (strlen($new_pass) < 8) {
               $message[] = 'New password must be at least 8 characters long!';
           } else {
               // Update the password
               $update_admin_pass = $conn->prepare("UPDATE `admins` SET password = ? WHERE id = ?");
               $update_admin_pass->execute([$confirm_pass, $admin_id]);
               $message[] = 'Password updated successfully!';
           }
       } else {
           $message[] = 'Please enter a new password!';
       }
   }
}

?>


<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Update profile</title>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

        <link rel="stylesheet" href="../css/admin_style.css">

    </head>

    <body>

        <?php include '../components/admin_header.php'; ?>

        <section class="form-container">

            <form action="" method="post">
                <h3>update profile</h3>
                <input type="hidden" name="prev_pass" value="<?= $fetch_profile['password']; ?>">
                <input type="text" name="name" value="<?= $fetch_profile['name']; ?>" required
                    placeholder="enter your username" maxlength="20" class="box"
                    oninput="this.value = this.value.replace(/\s/g, '')">
                <input type="password" name="old_pass" placeholder="enter old password" minlength="8" class="box"
                    oninput="this.value = this.value.replace(/\s/g, '')">
                <input type="password" name="new_pass" placeholder="enter new password" minlength="8" class="box"
                    oninput="this.value = this.value.replace(/\s/g, '')">
                <input type="password" name="confirm_pass" placeholder="confirm new password" minlength="8" class="box"
                    oninput="this.value = this.value.replace(/\s/g, '')">
                <input type="submit" value="update now" class="btn" name="submit">
            </form>

        </section>












        <script src="../js/admin_script.js"></script>

    </body>

</html>