🚀 Final Working Steps: Deploy Flutter Web App on EC2 (Ubuntu)
🧩 Step 1: Connect to your EC2 Instance

From your local machine:

ssh -i "your-key.pem" ubuntu@<your-ec2-public-ip>

🧰 Step 2: Update and Install Required Packages

Once logged in:

sudo apt update
sudo apt install -y nginx unzip

🏗️ Step 3: Build Your Flutter Web App (on Local System)

On your local computer:

flutter build web


You’ll get the folder:

build/web/

📤 Step 4: Upload Web Build Files to EC2

On your local terminal, run:

scp -i "your-key.pem" -r build/web ubuntu@<your-ec2-public-ip>:/home/ubuntu/


Rename it for clarity:

ssh -i "your-key.pem" ubuntu@<your-ec2-public-ip>
mv /home/ubuntu/web /home/ubuntu/webapp

🗂️ Step 5: Set Permissions Correctly

This step is what prevents the 500 “Permission Denied” error:

sudo chown -R www-data:www-data /home/ubuntu/webapp
sudo chmod -R 755 /home/ubuntu/webapp
sudo chmod 755 /home/ubuntu


Now Nginx (which runs as www-data) can access your Flutter build.

⚙️ Step 6: Configure Nginx

Remove the default config:

sudo rm /etc/nginx/sites-enabled/default


Create a new config file:

sudo nano /etc/nginx/sites-available/flutter_web


Paste this configuration:

server {
    listen 80;
    server_name _;

    root /home/ubuntu/webapp;
    index index.html;

    location / {
        try_files $uri $uri/ /index.html;
    }
}


Enable it:

sudo ln -s /etc/nginx/sites-available/flutter_web /etc/nginx/sites-enabled/


Check for syntax errors:

sudo nginx -t


If you get syntax is ok → proceed to restart:

sudo systemctl restart nginx

🌐 Step 7: Allow HTTP in AWS Security Group

In your AWS console:

Go to EC2 → Instances → Security → Inbound Rules

Add rule:

Type: HTTP

Port Range: 80

Source: 0.0.0.0/0 (or your IP)

✅ Step 8: Test Your App

In your browser:

http://<your-ec2-public-ip>


You should now see your Flutter web app live 🎉

🔒 Optional: Add HTTPS with Certbot

If you have a domain name and want SSL:

sudo apt install -y certbot python3-certbot-nginx
sudo certbot --nginx -d yourdomain.com -d www.yourdomain.com

💡 Quick Recap
Step	Description
1	SSH into EC2
2	Install Nginx
3	Build Flutter web
4	Upload build/web to EC2
5	Fix file permissions (chown, chmod)
6	Configure Nginx to serve from /home/ubuntu/webapp
7	Open port 80 in AWS Security Group
8	Access your public IP in browser