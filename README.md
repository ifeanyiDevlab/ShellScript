Apache Web Server Installation & Frontend Template Setup

Task: Installing an Apache web server, downloading a frontend template, copying it to the web server's root directory, and executing it using shell scripting:


This README provides step-by-step instructions to install Apache web server, download a frontend template, and set up the template on the web server using shell scripting.

Prerequisites

Ensure that the system meets the following prerequisites:

- A Linux-based operating system (Ubuntu/Debian or CentOS/RedHat).
- A user account with root or sudo privileges.
- An internet connection to download Apache and the frontend template.

Instructions

1. Install Apache Web Server

Before proceeding with the frontend template setup, we need to install Apache web server.

For Ubuntu/Debian-based systems:

sudo apt update
sudo apt install apache2 -y


For CentOS/RedHat-based systems:

sudo yum update
sudo yum install httpd -y

After installation, start and enable Apache service:

sudo systemctl start apache2    # Ubuntu/Debian
sudo systemctl enable apache2   # Ubuntu/Debian

sudo systemctl start httpd      # CentOS/RedHat/Amazon Linux
sudo systemctl enable httpd     # CentOS/RedHat/Amazon Linux


Check the Apache installation by opening a web browser and typing "http://localhost/" or "http://<server-ip>". If you see the Apache default page, it’s installed successfully.

2. Download Frontend Template

Download the frontend template (either from a URL or a GitHub repository) and extract it.

Example using "wget" to download a template:

bash
cd /tmp
wget https://example.com/frontend-template.zip  # Replace with the actual template URL
unzip frontend-template.zip -d /tmp/frontend


3. Copy Frontend Template to Web Server Directory

Copy the template files to the Apache web server’s root directory.


sudo cp -r /tmp/frontend/* /var/www/html/


Make sure Apache has permission to access the files:


sudo chown -R www-data:www-data /var/www/html


4. Shell Script for Automating the Process

Now, you can automate the entire process by using a shell script. Here's a sample shell script to automate the installation, download, and copy process.

Example Shell Script: "setup_apache_template.sh"

bash
#!/bin/bash

#Update system and install Apache
echo "Updating system and installing Apache..."
sudo apt update && sudo apt install apache2 -y

#Start and enable Apache service
echo "Starting and enabling Apache..."
sudo systemctl start apache2
sudo systemctl enable apache2

#Download and unzip the frontend template
echo "Downloading frontend template..."
cd /tmp
wget https://example.com/frontend-template.zip  # Replace with actual URL
unzip frontend-template.zip -d /tmp/frontend

#Copy template files to Apache's web root directory
echo "Copying template to web server directory..."
sudo cp -r /tmp/frontend/* /var/www/html/

#Set correct permissions for Apache user
echo "Setting permissions for Apache user..."
sudo chown -R www-data:www-data /var/www/html

#Restart Apache to apply changes
echo "Restarting Apache..."
sudo systemctl restart apache2

echo "Apache installation and frontend template setup completed!"


5. Execute the Shell Script

Make the script executable and run it:


chmod +x setup_apache_template.sh
./setup_apache_template.sh


This script will:

1. Install Apache if it's not already installed.
2. Download the frontend template and unzip it.
3. Copy the template files to the correct Apache directory ("/var/www/html").
4. Set the correct permissions for Apache to access the files.
5. Restart Apache to apply the changes.

6. Verify the Setup

After executing the script, open your browser and navigate to "http://localhost/" or "http://<your-server-ip>". You should see your frontend template loaded.


This README provides a clear overview of how to set up the Apache web server, download and deploy a frontend template, and automate the process with a shell script.
