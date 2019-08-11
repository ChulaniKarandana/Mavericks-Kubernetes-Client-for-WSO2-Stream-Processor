TEST="curl -k -X GET https://10.11.254.240:32390/siddhi-apps?isActive=true  -H accept:application/json -u admin:admin -k"
    #echo $TEST
    RESPONSE=`$TEST`
    #echo $RESPONSE
    echo 'printing the size'
    
    LEN=${#RESPONSE[0]}
    
    if (($LEN > 2));
    then
      echo "There are Partial Siddhi Apps in the worker $u";
     
    else
      echo "There are no Partial Siddhi Apps in the worker $u";
      should_undeploy+=($u)
    fi







#kubectl expose deployment wso2sp-worker-1 --type=NodePort --name=wso2sp-worker-1-service-1

#kubectl get nodes -o jsonpath='{ $.items[*].status.addresses[?(@.type=="ExternalIP")].address }'; echo
#to take values in array         for ((i=0; i<${#my_array[@]}; ++i)); do     echo "animal $i: ${my_array[$i]}"; done



#NODEPORT=$(kubectl get -o jsonpath="{.spec.ports[0].nodePort}" services wso2sp-worker-1) ===========> get nodeport from service
#NODES=$(kubectl get nodes -o jsonpath='{ $.items[*].status.addresses[?(@.type=="ExternalIP")].address }')







#kubectl get pod -l app=wso2sp-worker-1 -o=custom-columns=NODE:.spec.nodeName
#gives node name for pod label

#k=$(kubectl get pod -l app=wso2sp-worker-1 -o=custom-columns=NODE:.spec.nodeName)
#echo $k
#NODE gke-wso2-sp-distributed--default-pool-4c80657b-qjbm




#echo ${j[$i]}   (i=0)
#NODE gke-wso2-sp-distributed--default-pool-4c80657b-qjbm

#SUBSTRING=$(echo ${j[$i]}| cut -d' ' -f 2)   ===> gives corresponding nodenme



#my_array=(red orange green)
#value='green'

#for i in "${!my_array[@]}"; do
#   if [[ "${my_array[$i]}" = "${value}" ]]; then
#       echo "${i}";
#   fi
#done



#k=$(kubectl get nodes --selector=kubernetes.io/role!=master -o jsonpath={.items[*].status.addresses[?\(@.type==\"ExternalIP\"\)].address})
#SUBSTRING=$(echo ${k[$i]}| cut -d' ' -f 2)
#echo $SUBSTRING


#y=$(kubectl get nodes)
#SUBSTRING=$(echo ${y[0]}| cut -d' ' -f 6)
#SUBSTRING=$(echo ${y[0]}| cut -d' ' -f 16)



#for iter in {6..21..5}; do 
#    echo ${nodes_list[$iter]}
#    SUB=$(echo ${nodes_list[0]}| cut -d' ' -f $iter)
#    echo $SUB;
#    nodes+=($SUB)
#    echo "---------------"
#    echo $nodes
#done


#mxxxx=20
#workers_list=( wso2sp-worker-2 wso2sp-worker-4 )


#curl -k -X GET https://35.237.74.71:30137/siddhi-apps?isActive=true  -H accept:application/json -u admin:admin -k



