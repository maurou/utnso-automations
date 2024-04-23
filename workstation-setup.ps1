# Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Install GCC and Make
choco install mingw -y
choco install make -y

# Prompt user to enter desired directory for repositories
$r = Read-Host -Prompt "Enter directory for repositories:"
cd $r

# Install common libraries
git clone https://github.com/sisoputnfrba/so-commons-library
cd so-commons-library
make debug
make install

# Configure git user
Write-Host "Configuring git user..."
$ue = Read-Host -Prompt "Enter email:"
git config --global user.email $ue
$un = Read-Host -Prompt "Enter user name:"
git config --global user.name $un
git config --global credential.helper manager-core