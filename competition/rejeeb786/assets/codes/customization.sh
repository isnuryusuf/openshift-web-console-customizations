#!/bin/bash
echo "######################################################"
echo "########## Initiating Console Customization ##########"
echo "######################################################"
echo "# TASK 1: Create temporary directory"
mkdir /tmp/script_dir &> /dev/null
echo -e "\u2714 Created temporary directory: /tmp/script_dir"
cd /tmp/script_dir &> /dev/null
echo "# TASK 1: Completed"
echo "###################"
echo "# TASK 2: Add a custom logo and product name"
wget https://raw.githubusercontent.com/rejeeb786/openshift-web-console-customizations/master/competition/rejeeb786/assets/images/console-custom-logo.png &> /dev/null
echo -e "\u2714 Downloaded sample logo"
oc create configmap console-custom-logo --from-file console-custom-logo.png -n openshift-config &> /dev/null
echo -e "\u2714 Imported logo file into config map"
oc patch console.operator.openshift.io cluster --type='merge' --patch '{"spec":{"customization": { "customLogoFile": {"key":"console-custom-logo.png","name": "console-custom-logo"},"customProductName":"Sample Company Inc"}}}' &> /dev/null
echo -e "\u2714 Patched the web console’s operator configuration"
echo "# TASK 2: Completed"
echo "###################"
echo "# TASK 3: Create custom links in the web console"
wget https://raw.githubusercontent.com/rejeeb786/openshift-web-console-customizations/master/competition/rejeeb786/assets/codes/console-link-help-menu-1.yaml &> /dev/null
echo -e "\u2714 Downloaded YAML file definition to add the link to the Latest OCP Release"
wget https://raw.githubusercontent.com/rejeeb786/openshift-web-console-customizations/master/competition/rejeeb786/assets/codes/console-link-help-menu-2.yaml &> /dev/null
echo -e "\u2714 Downloaded YAML file definition to add the link to the Red Hat CVE Database"
wget https://raw.githubusercontent.com/rejeeb786/openshift-web-console-customizations/master/competition/rejeeb786/assets/codes/console-link-help-menu-3.yaml &> /dev/null
echo -e "\u2714 Downloaded YAML file definition to add the link to Contact Red Hat"
oc apply -f console-link-help-menu-1.yaml &> /dev/null
oc apply -f console-link-help-menu-2.yaml &> /dev/null
oc apply -f console-link-help-menu-3.yaml &> /dev/null
echo -e "\u2714 Added custom links within the Help Menu"
wget https://raw.githubusercontent.com/rejeeb786/openshift-web-console-customizations/master/competition/rejeeb786/assets/codes/console-link-user-menu-1.yaml &> /dev/null
echo -e "\u2714 Downloaded YAML file definition to add the link to Change Password of the user"
wget https://raw.githubusercontent.com/rejeeb786/openshift-web-console-customizations/master/competition/rejeeb786/assets/codes/console-link-user-menu-2.yaml &> /dev/null
echo -e "\u2714 Downloaded YAML file definition to add the link to Contact IT Team of the organization"
oc apply -f console-link-user-menu-1.yaml &> /dev/null
oc apply -f console-link-user-menu-2.yaml &> /dev/null
echo -e "\u2714 Added custom links within the User Menu"
wget https://raw.githubusercontent.com/rejeeb786/openshift-web-console-customizations/master/competition/rejeeb786/assets/codes/application-menu-link-1.yaml &> /dev/null
echo -e "\u2714 Downloaded YAML file definition to add the link to Red Hat Subscription Management"
wget https://raw.githubusercontent.com/rejeeb786/openshift-web-console-customizations/master/competition/rejeeb786/assets/codes/application-menu-link-2.yaml &> /dev/null
echo -e "\u2714 Downloaded YAML file definition to add the link to Launch a Meeting"
oc apply -f application-menu-link-1.yaml &> /dev/null
oc apply -f application-menu-link-2.yaml &> /dev/null
echo -e "\u2714 Added custom links within the Application Menu"
oc new-project sample-namespace &> /dev/null
oc new-project test-namespace &> /dev/null
echo -e "\u2714 Created two test namespaces - (sample-namespace and test-namespace)"
wget https://raw.githubusercontent.com/rejeeb786/openshift-web-console-customizations/master/competition/rejeeb786/assets/codes/namespaced-dashboard-1.yaml &> /dev/null
echo -e "\u2714 Downloaded YAML file definition to add the link to Report Anomaly within the cluster/project"
wget https://raw.githubusercontent.com/rejeeb786/openshift-web-console-customizations/master/competition/rejeeb786/assets/codes/namespaced-dashboard-2.yaml &> /dev/null
echo -e "\u2714 YAML file definition to add the link to Request Elevated Privileges within a project"
oc apply -f namespaced-dashboard-1.yaml &> /dev/null
oc apply -f namespaced-dashboard-2.yaml &> /dev/null
echo -e "\u2714 Added custom links within the Namespace Dashboard"
echo "# TASK 3: Completed"
echo "###################"
echo "# TASK 4: Customize login/IdP selection page"
wget https://raw.githubusercontent.com/rejeeb786/openshift-web-console-customizations/master/competition/rejeeb786/assets/codes/providers.html &> /dev/null
echo -e "\u2714 Downloaded sample IdP selection template file"
oc create secret generic providers-template --from-file=providers.html -n openshift-config &> /dev/null
echo -e "\u2714 Created providers-template secret"
oc patch oauths cluster --type='merge' --patch '{"spec":{"templates": { "providerSelection": {"name":"providers-template"}}}}' &> /dev/null
echo -e "\u2714 Patched the authentication configuration"
wget https://raw.githubusercontent.com/rejeeb786/openshift-web-console-customizations/master/competition/rejeeb786/assets/codes/login.html &> /dev/null
echo -e "\u2714 Downloaded sample login page template file"
oc create secret generic login-template --from-file=login.html -n openshift-config &> /dev/null
echo -e "\u2714 Created login-template secret"
oc patch oauths cluster --type='merge' --patch '{"spec":{"templates": { "login": {"name":"login-template"}}}}'
echo -e "\u2714 Patched authentication configuration"
echo -e "\u2714 Generated custom login/IdP selection page"
echo "# TASK 4: Completed"
echo "###################"
echo "# TASK 5: Create custom notification banners"
wget https://raw.githubusercontent.com/rejeeb786/openshift-web-console-customizations/master/competition/rejeeb786/assets/codes/banner-top.yaml &> /dev/null
echo -e "\u2714 Downloaded YAML file definition to add custom notification banners at top"
wget https://raw.githubusercontent.com/rejeeb786/openshift-web-console-customizations/master/competition/rejeeb786/assets/codes/banner-bottom.yaml &> /dev/null
echo -e "\u2714 Downloaded YAML file definition to add custom notification banners at bottom"
oc apply -f banner-top.yaml &> /dev/null
oc apply -f banner-bottom.yaml &> /dev/null
echo -e "\u2714 Added custom notification banners"
echo "# TASK 5: Completed"
echo "###################"
echo "# TASK 6: Customize CLI downloads"
wget https://raw.githubusercontent.com/rejeeb786/openshift-web-console-customizations/master/competition/rejeeb786/assets/codes/github-cli.yaml &> /dev/null
echo -e "\u2714 Downloaded YAML file definition to include GitHub CLI download links"
oc apply -f github-cli.yaml &> /dev/null
echo -e "\u2714 Added GitHub CLI download links"
echo "# TASK 6: Completed"
echo "###################"
echo "# TASK 7: Add YAML examples to Kubernetes resources"
wget https://raw.githubusercontent.com/rejeeb786/openshift-web-console-customizations/master/competition/rejeeb786/assets/codes/secret-yaml-sample.yaml &> /dev/null
echo -e "\u2714 Downloaded YAML file definition to add a Secret YAML example"
wget https://raw.githubusercontent.com/rejeeb786/openshift-web-console-customizations/master/competition/rejeeb786/assets/codes/configmap-yaml-sample.yaml &> /dev/null
echo -e "\u2714 Downloaded YAML file definition to add a ConfigMap YAML example"
oc apply -f secret-yaml-sample.yaml &> /dev/null
oc apply -f configmap-yaml-sample.yaml &> /dev/null
echo -e "\u2714 Added YAML examples to Kubernetes resources"
echo "# TASK 7: Completed"
echo "####################################################"
echo "########## Console Customization Complete ##########"
echo "####################################################"
