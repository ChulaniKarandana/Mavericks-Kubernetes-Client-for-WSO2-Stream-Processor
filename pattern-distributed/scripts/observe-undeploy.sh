#!/bin/bash
CT="Content-Type:application/json"

#takes the ip list using
nodes_number=4
max_num=$(($nodes_number * 5))
mxxxx=20
workers_list=( wso2sp-worker-2 wso2sp-worker-4 )
should_undeploy=()
nodes_list_raw=$( kubectl get nodes )
nodes_list=${nodes_list_raw[0]}
echo $nodes_list;

nodes=()
for iter in {6..21..5}; do 
    echo ${nodes_list[$iter]}
    SUB=$(echo ${nodes_list[0]}| cut -d' ' -f $iter)
    echo $SUB;
    nodes+=($SUB)
    echo "---------------"
    echo $nodes
done

echo ${nodes[2]}
echo "${#nodes[@]}"

ip_list=$( kubectl get nodes --selector=kubernetes.io/role!=master -o jsonpath={.items[*].status.addresses[?\(@.type==\"ExternalIP\"\)].address} )
echo $ip_list

SERVICE="-service-1"

#curl -k -X GET https://35.237.74.71:30137/siddhi-apps?isActive=true  -H accept:application/json -u admin:admin -k

for u in "${workers_list[@]}"  
do  
    MY_SERVICE="$u$SERVICE"
    echo $MY_SERVICE;
    kubectl expose deployment $u --type=NodePort --name=$MY_SERVICE
    NODEPORT=$(kubectl get -o jsonpath="{.spec.ports[0].nodePort}" services $u)
    echo $NODEPORT;
    #$RULE=$u
    gcloud compute firewall-rules create rule-1 --allow=tcp:$NODEPORT
    
    MY_NODE_RAW=$(kubectl get pod -l app=$u -o=custom-columns=NODE:.spec.nodeName)
    MY_NODE=$(echo ${MY_NODE_RAW[0]}| cut -d' ' -f 2)
    echo $MY_NODE;
    
    for ((i=0; i<=${#nodes[@]}; i++))
    do
    	NODE_NAME=${nodes[$i]}
    	echo $NODE_NAME;
    	if [[ "${NODE_NAME}" = "${MY_NODE}" ]]; then
        	echo "${i}";
                IP_INDEX=${i}
                echo "mtched...."
    	fi
    	
    done
    
    NODE_IP_INDEX=$(($IP_INDEX + 1))
    NODE_IP=$(echo ${ip_list[0]}| cut -d' ' -f $NODE_IP_INDEX)
    echo "############"
    echo $NODE_IP
    
    TEST="curl -k -X GET https://$NODE_IP:$NODEPORT/siddhi-apps?isActive=true  -H accept:application/json -u admin:admin -k"
    RESPONSE=`$TEST`
    LEN=${#RESPONSE[0]}
    echo "@@@@@@@@@@@@@@@@@"
    echo $LEN

    if (($LEN > 2));
    then
      echo "There are Partial Siddhi Apps in the worker $u";
     
    else
      echo "There are no Partial Siddhi Apps in the worker $u";
      should_undeploy+=($u)
      
    fi
    gcloud compute firewall-rules delete rule-1
done  
echo "The workers that needed to be undeployed.............."
echo "${should_undeploy[*]}"


