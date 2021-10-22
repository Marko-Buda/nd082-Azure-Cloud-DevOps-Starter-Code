# Azure Infrastructure Operations Project: Deploying a scalable IaaS web server in Azure

### Introduction
For this project, you will write a Packer template and a Terraform template to deploy a customizable, scalable web server in Azure.

### Getting Started
1. Clone this repository using command _git clone_ (link to repository [here](https://github.com/Marko-Buda/nd082-Azure-Cloud-DevOps-Starter-Code.git)).

2. Open terminal and navigate towards starter_files folder located inside C1 - Azure Infrastructure directory.

3. For deployment of a scalable web server your main focus are the following three files - two terraform template files _main_, _vars_, packer template file _server.json_ and a policy definition _project_policy.json_ file.

4. Before building packer image for Virtual Machine or deploying IaaS through terraform please run **az policy definition create** to create a new policy definition with extra argument **--name _tagging policy_**.

5. Run **az policy assignment create** with additional paramenters --name (name of the policy assignment) --policy (name of created policy definition).

6. If no errors appear during the previous step, the policy should be visible by running command  **az policy assignment list**. 
    > **NOTE**: It will display two policies. One default that is automatically provided by Azure itself and the other one is the one we created. <br /> On the following [link]() you can view the screenshoot of the output of that command.

### Dependencies
1. Create an [Azure Account](https://portal.azure.com) 
2. Install the [Azure command line interface](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest)
3. Install [Packer](https://www.packer.io/downloads)
4. Install [Terraform](https://www.terraform.io/downloads.html)

### Instructions

1. Before building a packer image please create in Azure Portal a resource group that contains the same name mentioned in 
   > **packer validate** 
2. Run **packer build** and wait for the build to finish with message:
    > Build 'azure-arm' finished after 5 minutes 23 seconds.<br />
==> Wait completed after 5 minutes 23 seconds<br />
==> Builds finished. The artifacts of successful builds are:<br />
--> azure-arm: Azure.ResourceManagement.VMImage:
3. Go to Azure portal and check that a image named _"UbuntuPackerImage"_ is created under resource group _"project-one-resource-group"_.
4. Return to terminal.
5. Run **terraform validate** to check that no syntax errors are present.
6. Run **terraform plan** and enter the number of Virtual Machines that you want to deploy and the location of their deployment.

    > **NOTE**: The location of VM deployment must be the same as the one set in packer image. Otherwise expect terraform to return an error regarding the wrongly set location.<br /> This command creates an execution plan. It will tell you the number of resources that are going to be created.
7. If no error appears in the previous step run **terraform apply** command and wait for it to finish deployment (this usually take several minutes).

### Output
After you succesfully deploy your IaaS web server you should receive the following message:
> Apply complete! Resources: 17 added, 0 changed, 0 destroyed.

The 17 added resources are total number of the resources that were created when two Virtual Machines were deployed to Azure.

The expected output of terraform plan can be viewed on this [link](https://github.com/Marko-Buda/nd082-Azure-Cloud-DevOps-Starter-Code/blob/master/C1%20-%20Azure%20Infrastructure%20Operations/project/starter_files/solution.plan).