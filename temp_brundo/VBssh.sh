#! /bin/sh

#Params
VM=$2

#Conf:
HOST_PORT=2244
INT_PORT=22
PROT="TCP"


K1="VBoxInternal/Devices/pcnet/0/LUN#0/Config/ssh/HostPort"
K2="VBoxInternal/Devices/pcnet/0/LUN#0/Config/ssh/GuestPort"
K3="VBoxInternal/Devices/pcnet/0/LUN#0/Config/ssh/Protocol"



ssh_set(){
	echo "Configurazione accesso ssh della macchina virtuale "$VM
	echo "La macchina guest DEVE essere attiva!" 
	#Devo controllare quanto sopra
	echo ""
	VBoxManage setextradata $VM $K1 $HOST_PORT
	VBoxManage setextradata $VM $K2 $INT_PORT
	VBoxManage setextradata $VM $K3 $PROT
	echo "Conf completata! Spegni la macchina guest e riavvia Virtualbox"
}


ssh_unset(){
	echo "Eliminazione accesso ssh della macchina virtuale "$VM
	echo ""
	VBoxManage setextradata $VM $K1
	VBoxManage setextradata $VM $K2
	VBoxManage setextradata $VM $K3
	echo "Fatto!!"
}

vb_status(){
	echo "Parametri della macchina virtuale: " $VM
	echo ""
	#devo controllare che la macchina esista!
	VBoxManage getextradata $VM enumerate |grep -i key
}

vb_list(){
	echo "Macchine virtuali trovate:"
	echo ""
	VBoxManage list vms|grep -i name|grep -vi mapping
}

conf(){
	echo "La porta" $HOST_PORT "viene rimappata sulla" $INT_PORT "del client sotto la voce ssh"
}

case "$1" in
'start' | 'up' | 'on' )
	ssh_set $2
	;;
'stop' | 'down' | 'off' )
	ssh_unset
	;;
'status'|'show')
	vb_status
	;;
'list')
	vb_list
	;;
'conf')
	conf
	;;
*)
	echo "Uso: $0 {start|stop|status} <VirtualMachineName>"
	;;
esac
