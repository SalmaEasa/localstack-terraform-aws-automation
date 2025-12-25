#!/bin/bash
#apt update
apt install -y apache2 curl awscli

# Get instance metadata
INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)
HOSTNAME=$(hostname)

cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
  <title>Server 2</title>
  <style>
    body {
      background-color: #020617;
      color: white;
      font-family: Arial, sans-serif;
      text-align: center;
      padding-top: 100px;
    }
    .card {
      background: #0f172a;
      padding: 40px;
      border-radius: 12px;
      width: 60%;
      margin: auto;
      box-shadow: 0 0 20px rgba(34, 197, 94, 0.4);
    }
    h1 {
      color: #22c55e;
      animation: glow 2s infinite alternate;
    }
    @keyframes glow {
      from { text-shadow: 0 0 10px #22c55e; }
      to { text-shadow: 0 0 25px #4ade80; }
    }
  </style>
</head>
<body>
  <div class="card">
    <h1>Server 2</h1>
    <h2>Welcome to Server 2 🌍</h2>
    <p><strong>Instance ID:</strong> $INSTANCE_ID</p>
    <p><strong>Hostname:</strong> $HOSTNAME</p>
    <p>Provisioned via Terraform Infrastructure as Code</p>
  </div>
</body>
</html>
EOF

systemctl start apache2
systemctl enable apache2
