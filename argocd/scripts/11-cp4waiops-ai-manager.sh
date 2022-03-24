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
echo "  🚀 CloudPak for Watson AIOps v3.3 - AI MANAGER Install "
echo "  "
echo "***************************************************************************************************************************************************"
echo "***************************************************************************************************************************************************"
echo "***************************************************************************************************************************************************"
echo "  "
echo "  "

# ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# GET PARAMETERS
# ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ------------------------------------------------------------------------------------------------------------------------------------------------------------------------


while getopts "t:v:p:l:c:" opt
do
    case "$opt" in
        t ) INPUT_TOKEN="$OPTARG" ;;
        v ) VERBOSE="$OPTARG" ;;
    esac
done



if [[ $INPUT_TOKEN == "" ]];
then
    echo " ERROR: Please provide the Registry Token"
    echo " USAGE: $0 -t <REGISTRY_TOKEN> [-v true]"
    exit 1
else
    echo " 🔐  Token                     Provided"
    export ENTITLED_REGISTRY_KEY=$INPUT_TOKEN
fi

echo ""

if [[ $VERBOSE ]];
then
    echo " ✅ Verbose Mode               On"
    export ANSIBLE_DISPLAY_SKIPPED_HOSTS=true
    export VERBOSE="-v"
else
    echo " ❌ Verbose Mode               Off      (You can enable it by appending '-v true')"
    export ANSIBLE_DISPLAY_SKIPPED_HOSTS=false
    export VERBOSE=""
fi


# ---------------------------------------------------------------------------------------------------------------------------------------------------"
# ---------------------------------------------------------------------------------------------------------------------------------------------------"
# Init Code - SED for Mac
# ---------------------------------------------------------------------------------------------------------------------------------------------------"
# ---------------------------------------------------------------------------------------------------------------------------------------------------"
        # fix sed issue on mac
        OS=$(uname -s | tr '[:upper:]' '[:lower:]')
        SED="sed"
        if [ "${OS}" == "darwin" ]; then
            SED="gsed"
            if [ ! -x "$(command -v ${SED})"  ]; then
            __output "This script requires $SED, but it was not found.  Perform \"brew install gnu-sed\" and try again."
            exit
            fi
        fi

echo ""
echo ""
echo ""
echo ""
echo ""




echo "***************************************************************************************************************************************************"
echo "  "
echo "  🚀 Starting installation "
echo "  "
echo "***************************************************************************************************************************************************"


echo "  "
echo "***************************************************************************************************************************************************"
echo "  📥 Prepare ArgoCD Application Definition"
cp ./argocd/applications/argocd-cp4waiops-aimanager.yaml /tmp/cp4waiops-aimanager.yaml
${SED} -i "s/<PULL_TOKEN>/$ENTITLED_REGISTRY_KEY/" /tmp/cp4waiops-aimanager.yaml

cat /tmp/cp4waiops-aimanager.yaml

echo "  "
echo "***************************************************************************************************************************************************"
echo "  📥 Create Application in ArgoCD"
oc apply -n argocd -f /tmp/cp4waiops-aimanager.yaml

