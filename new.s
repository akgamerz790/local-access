Start-Service sshd
____________________________
Set-Service -Name sshd -StartupType 'Automatic'
____________________________
New-NetFirewallRule -Name sshd -DisplayName 'OpenSSH Server (sshd)' -Enabled True -Protocol TCP -Action Allow -LocalPort 22
____________________________
ssh username@remote_ip
==========================
ssh root@192.168.1.10
________________________________________________________________________________________________________________
5. Using SSH Key Authentication (Optional):

Agar tum password-less login chahte ho, toh tum SSH key authentication bhi setup kar sakte ho.

    Generate SSH Key Pair (Windows pe PowerShell ya Git Bash mein):

ssh-keygen

Tumhare public key ko remote machine ke ~/.ssh/authorized_keys file mein daalna hoga.

Ab tum bina password ke direct SSH kar sakte ho.
________________________________________________________________________________________________________________
📌 Step 3: Firewall Me FTP Port Allow Karo

    Windows Firewall me allow karna padega:

    netsh advfirewall firewall add rule name="FTP Server" action=allow protocol=TCP dir=in localport=21

📌 Step 4: Router Me Port Forwarding Karo
________________________________________________________________________________________________________________
🔐 Plan: School PC Pe Key Generate + Ghar Le Aana Remotely (No USB)
📌 Step 1: School PC Pe SSH Key Pair Banana (Windows)

Agar school PC me Git Bash ya PowerShell hai, toh ye command chalalo:

ssh-keygen -t rsa -b 2048 -C "madhur@school"

    Jab puche: Enter file in which to save the key → Type karo:

    C:\Users\<YourUsername>\.ssh\id_rsa

    Ye banayega:

        C:\Users\<YourUsername>\.ssh\id_rsa → Private key

        C:\Users\<YourUsername>\.ssh\id_rsa.pub → Public key

    Important: Public key ko authorized_keys me copy mat karo, kyunki yeh server ban raha hai — public key tumhare Kali system se aayegi.