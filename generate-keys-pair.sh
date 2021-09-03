#!/bin/bash
clear
echo "Generating RSA Private/Public key pair..."
ssh-keygen -t rsa -m PEM -b 4096 -f id_rsa -N ""
ssh-keygen -f id_rsa.pub -e -m pem > id_rsa.pub.pem


echo "Converting RSA Private/Public keys to PKCS#8 format..."
openssl pkcs8 -topk8 -inform PEM -outform PEM -nocrypt -in id_rsa -out private_key
openssl rsa -RSAPublicKey_in -in id_rsa.pub.pem -out public_key

echo "Converting PKCS#8 Private Key to Base64..."
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
base64 -i private_key
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
echo ""
echo ""
echo "Converting PKCS#8 Public Key to Base64..."
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
base64 -i public_key
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"

rm id_rsa*
rm private_key
rm public_key