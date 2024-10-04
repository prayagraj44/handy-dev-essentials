#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>prayag-site</title>
    <style>
        .card {
            background-color: #d0e1f9; /* Grey-blueish pastel color */
            border: 1px solid #ccc;
            border-radius: 8px;
            padding: 20px;
            max-width: 300px;
            margin: 20px auto;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
			font-family: 'Comic Sans MS', cursive;
        }
    </style>
</head>
<body>
    <div class="card">
        <h1>Welcome to Prayag's Site! 🚀 from $(hostname -f)</h1>
    </div>
</body>
</html>" > /var/www/html/index.html
