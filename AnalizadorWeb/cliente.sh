
#script para generar las keys para los clientes
#
#modo ejeucion sudo sh cliente.sh nombreCliente
PKITOOL=/etc/openvpn/easy-rsa-V2.0
KEY=/etc/openvpn/easy-rsa-V2.0/keys
sudo su
echo "Entrado a $PKITOOL"
cd /etc/openvpn/easy-rsa-V2.0/
pwd
echo "Ejecutando source vars"
source ./vars
./pkitool $1
echo "Creando carpeta $1"
mkdir -p  ~/$1
echo "Entrando a $KEY/"
echo "Copiando llaves"
sudo cp -v $KEY/ca.crt $KEY/$1.*  $KEY/ta.key ~/$1
sudo chmod -R 755 ~/$1









