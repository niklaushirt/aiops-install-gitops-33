#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#       __________  __ ___       _____    ________            
#      / ____/ __ \/ // / |     / /   |  /  _/ __ \____  _____
#     / /   / /_/ / // /| | /| / / /| |  / // / / / __ \/ ___/
#    / /___/ ____/__  __/ |/ |/ / ___ |_/ // /_/ / /_/ (__  ) 
#    \____/_/      /_/  |__/|__/_/  |_/___/\____/ .___/____/  
#                                              /_/            
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------------------------------------------------------------"
#  Installing CP4WAIOPS v3.3
#
#  CloudPak for Watson AIOps
#
#  ©2021 nikh@ch.ibm.com
# ---------------------------------------------------------------------------------------------------------------------------------------------------"
# ---------------------------------------------------------------------------------------------------------------------------------------------------"
# ---------------------------------------------------------------------------------------------------------------------------------------------------"
# ---------------------------------------------------------------------------------------------------------------------------------------------------"
clear
echo "  "
echo "  "
echo "  "
echo "  "
echo "  "
echo "  "
echo "  "
echo "  "
echo "  "
echo "  "
echo "  "
echo "  "
echo "  "
echo "  "
echo "  "
echo "  "
echo "***************************************************************************************************************************************************"
echo "***************************************************************************************************************************************************"
echo "      __________  __ ___       _____    ________            "
echo "     / ____/ __ \/ // / |     / /   |  /  _/ __ \____  _____"
echo "    / /   / /_/ / // /| | /| / / /| |  / // / / / __ \/ ___/"
echo "   / /___/ ____/__  __/ |/ |/ / ___ |_/ // /_/ / /_/ (__  ) "
echo "   \____/_/      /_/  |__/|__/_/  |_/___/\____/ .___/____/  "
echo "                                             /_/            "
echo "***************************************************************************************************************************************************"
echo "***************************************************************************************************************************************************"
echo "***************************************************************************************************************************************************"
echo "***************************************************************************************************************************************************"
echo "  "
echo "  🚀 CloudPak for Watson AIOps v3.3 - Install RobotShop"
echo "  "
echo "***************************************************************************************************************************************************"
echo "***************************************************************************************************************************************************"
echo "***************************************************************************************************************************************************"
echo "  "
echo "  "





echo "***************************************************************************************************************************************************"
echo "  "
echo "  🚀 Starting installation"
echo "  "
echo "***************************************************************************************************************************************************"

echo "  "
echo "***************************************************************************************************************************************************"
echo "  📥 Create Namespace"
oc create ns robot-shop

echo "  "
echo "***************************************************************************************************************************************************"
echo "  📥 Create RobotShop Application in ArgoCD"
oc create clusterrolebinding default-robotinfo1-admin --clusterrole=cluster-admin --serviceaccount=robot-shop:default
oc apply -n openshift-gitops -f ./argocd/applications/argocd-addons-robot-shop.yaml

oc create clusterrolebinding default-robotinfo1-admin --clusterrole=cluster-admin --serviceaccount=default:default
