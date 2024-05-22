#!/bin/bash
apt update
apt install -y nginx

cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sample Webpage in Instance1</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #4CAF50;
            color: white;
            padding: 1rem;
            text-align: center;
        }
        nav {
            display: flex;
            justify-content: center;
            background-color: #333;
        }
        nav a {
            color: white;
            padding: 14px 20px;
            text-decoration: none;
            text-align: center;
        }
        nav a:hover {
            background-color: #ddd;
            color: black;
        }
        main {
            padding: 20px;
        }
        footer {
            background-color: #4CAF50;
            color: white;
            text-align: center;
            padding: 10px 0;
            position: fixed;
            width: 100%;
            bottom: 0;
        }
    </style>
</head>
<body>
    <header>
        <h1>Welcome to My Sample Webpage in Instance 1</h1>
    </header>
    <nav>
        <a href="#home">Home</a>
        <a href="#about">About</a>
        <a href="#services">Services</a>
        <a href="#contact">Contact</a>
    </nav>
    <main>
        <h2>Home</h2>
        <p>This is the home section of the webpage.</p>
        
        <h2 id="about">About</h2>
        <p>This is the about section of the webpage.</p>
        
        <h2 id="services">Services</h2>
        <p>This is the services section of the webpage.</p>
        
        <h2 id="contact">Contact</h2>
        <p>This is the contact section of the webpage.</p>
    </main>
    <footer>
        <p>&copy; 2024 My Sample Webpage</p>
    </footer>
</body>
</html>
EOF


systemctl start nginx
systemctl enable nginx