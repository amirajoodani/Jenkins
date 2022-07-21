# Install Java <br>
sudo apt install default-jre <br>
java --version <br>
sudo apt install default-jdk <br>
javac -version <br>

# Set Java Enviroment <br>
first determine where java installed : <br>
Sudo update-alternatives --config java <br>
sudo vi /etc/enviroment <br>
insert this : <br>
JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"   (The Address of java config result ) <br>
source /etc/enviroment <br>
echo $JAVA_HOME <br>

# Install Jenkins
add the Repository key to system : <br>
wget -q -O https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add - <br>
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list' <br>
sudo apt update <br>
sudo apt install jenkins <br>
sudo systemctl start jenkins <br>
sudo systemctl enable jenkins <br>

# active and allow firewall 
sudo ufw enable <br>
sudo ufw allow  OpenSSH <br>
sudo ufw allow 8080 <br>
sudo ufw status <br>

check your browser in address http://ip:8080 <br>

for see login password : sudo cat /var/lib/jenkins/secrets/initialAdminPassword <br>

then select install sugested plugin <br>

make admin user <br>

