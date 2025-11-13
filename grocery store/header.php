<?php
include 'config.php';

// Start session safely
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

// Get current logged-in user ID (if any)
$user_id = $_SESSION['user_id'] ?? '';

// Display system messages (like “added to cart”, etc.)
if (isset($message)) {
    foreach ($message as $msg) {
        echo '
        <div class="message">
            <span>' . htmlspecialchars($msg) . '</span>
            <i class="fas fa-times" onclick="this.parentElement.remove();"></i>
        </div>
        ';
    }
}
?>

<header class="header">
    <div class="flex">

        <a href="admin_page.php" class="logo">KrishiMitra<span>.</span></a>

        <nav class="navbar">
            <a href="home.php">home</a>
            <a href="shop.php">shop</a>
            <a href="orders.php">orders</a>
            <a href="about.php">about</a>
            <a href="contact.php">contact</a>
        </nav>

        <div class="icons">
            <div id="menu-btn" class="fas fa-bars"></div>
            <div id="user-btn" class="fas fa-user"></div>
            <a href="search_page.php" class="fas fa-search"></a>
            <?php
                // Safe default counts
                $cart_count = 0;
                $wishlist_count = 0;

                if (!empty($user_id)) {
                    $count_cart_items = $conn->prepare("SELECT * FROM `cart` WHERE user_id = ?");
                    $count_cart_items->execute([$user_id]);
                    $cart_count = $count_cart_items->rowCount();

                    $count_wishlist_items = $conn->prepare("SELECT * FROM `wishlist` WHERE user_id = ?");
                    $count_wishlist_items->execute([$user_id]);
                    $wishlist_count = $count_wishlist_items->rowCount();
                }
            ?>
            <a href="wishlist.php"><i class="fas fa-heart"></i><span>(<?= $wishlist_count; ?>)</span></a>
            <a href="cart.php"><i class="fas fa-shopping-cart"></i><span>(<?= $cart_count; ?>)</span></a>
        </div>

        <div class="profile">
            <?php
                if (!empty($user_id)) {
                    $select_profile = $conn->prepare("SELECT * FROM `users` WHERE id = ?");
                    $select_profile->execute([$user_id]);
                    $fetch_profile = $select_profile->fetch(PDO::FETCH_ASSOC);

                    if ($fetch_profile) {
                        echo '<img src="uploaded_img/' . htmlspecialchars($fetch_profile['image']) . '" alt="">';
                        echo '<p>' . htmlspecialchars($fetch_profile['name']) . '</p>';
                        echo '<a href="user_profile_update.php" class="btn">update profile</a>';
                        echo '<a href="logout.php" class="delete-btn">logout</a>';
                    }
                } else {
                    echo '<p>Please login first.</p>';
                    echo '<div class="flex-btn">';
                    echo '<a href="login.php" class="option-btn">login</a>';
                    echo '<a href="register.php" class="option-btn">register</a>';
                    echo '</div>';
                }
            ?>
        </div>

    </div>
</header>
