# Outfitters.com - E-Commerce Website

Outfitters.com is a fully functional e-commerce website built using PHP, HTML, and CSS. It provides both user and admin control panels, allowing for efficient management of products and users. The platform allows users to browse and purchase products, while the admin panel offers robust controls for managing product listings, user accounts, orders, and deliveries. With Outfitters.com, administrators have full control over the content and functionality, while users enjoy a seamless shopping experience.

## How to Use
1. **Clone or Download the Project**  
   You can clone this repository or download the project as a ZIP file. Once downloaded, extract the contents.

2. **XAMPP Installation and Setup**  
   Outfitters.com requires XAMPP to run the PHP and MySQL services.  
   - Download and install XAMPP from the official website.  
   - After installation, open the XAMPP control panel and start both the **Apache** (for PHP) and **MySQL** servers.

3. **Database Setup**
   - Open your browser and navigate to `localhost/phpmyadmin`.  
   - Create a new database named `shop_db`.  
   - Go to the "Import" section and import the `shop_db.sql` file provided with the project. This will create all the necessary tables and data for the website.

4. **Project Setup**
   - Move the extracted **Outfitters.com** project folder into the `xampp/htdocs` directory.  
   - Open your browser and navigate to `localhost/Outfitters` to view the website.

## User Login and Registration
- Users can register for an account through the registration form on the website.  
- Initially, there are no products added to the store. Once products are added by the admin, users can browse, add items to their cart or wishlist, and proceed to checkout.

## Admin Section
To access the admin panel:
1. **Manually Add Admin Credentials**  
   Since there are no default admin accounts, you will need to manually create an admin user.  
   - Open `localhost/phpmyadmin` and select the `shop_db` database.  
   - Navigate to the `admins` table and use the **Insert** option to create a new admin account (with a username and password).  
   - After creating the admin, you can log in to the admin dashboard using these credentials.

2. **Admin Dashboard Controls**  
   Once logged into the admin dashboard, the administrator can:
   - **Manage Users**: Add, update, or delete user accounts.
   - **Product Management**: Add new products to the store, update existing products, or delete them. Admins can use existing product images from the project's `images` folder.
   - **Order Tracking**: View, manage, and update the delivery status of user orders.
   - **Admin Management**: Add or remove additional admins for better control.

## User Section Features
- Users can view products listed on the website and:
   - Add items to the cart or wishlist.
   - Proceed to checkout and place an order.
   - Track the status of their orders.
   - Update their personal profile, including contact information and delivery preferences.

With these features, Outfitters.com provides a complete e-commerce solution for managing an online store from both the user and admin perspectives.