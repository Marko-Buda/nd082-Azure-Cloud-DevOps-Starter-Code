# Azure Infrastructure Operations Project: Deploying a scalable IaaS web server in Azure

### Introduction
For this project, you will write a Packer template and a Terraform template to deploy a customizable, scalable web server in Azure.

### Overview of the project
This project consists of three major parts that need to be done in order to successfully deploy a scalable web server in Azure.
The three main parts are: &nbsp;&nbsp;1. Policy definition and assignment<br />
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; 2. Packer template creation and build <br />
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; 3. Terraform template creation and deployment

For the web server to be succesfully deployed the above mentioned parts need to be done in the order they were listed.<br />
* Policy definition and assignment instructions are mentioned [here](https://github.com/Marko-Buda/nd082-Azure-Cloud-DevOps-Starter-Code/tree/master/C1%20-%20Azure%20Infrastructure%20Operations/project/starter_files#getting-started) under steps 4. to 6. <br />
* Packer template creation and build instructions are mentioned [here](https://github.com/Marko-Buda/nd082-Azure-Cloud-DevOps-Starter-Code/tree/master/C1%20-%20Azure%20Infrastructure%20Operations/project/starter_files#instructions) under steps 3. and 4. <br />
* Terraform template creation and deployment instructions are mentioned [here](https://github.com/Marko-Buda/nd082-Azure-Cloud-DevOps-Starter-Code/tree/master/C1%20-%20Azure%20Infrastructure%20Operations/project/starter_files#instructions) under steps 6. to 8. <br />

### Getting Started
1. Clone this repository using command _git clone_ (link to repository [here](https://github.com/Marko-Buda/nd082-Azure-Cloud-DevOps-Starter-Code.git)).

2. Open terminal and navigate towards starter_files folder located inside C1 - Azure Infrastructure directory.

3. For deployment of a scalable web server your main focus are the following three files - two terraform template files _main_, _vars_, packer template file _server.json_ and a policy definition _project_policy.json_ file.

4. Before building packer image for Virtual Machine or deploying IaaS through terraform please run **az policy definition create** to create a new policy definition with extra argument **--name _tagging policy_**.

5. Run **az policy assignment create** with additional paramenters --name (name of the policy assignment) --policy (name of created policy definition).

6. If no errors appear during the previous step, the policy should be visible by running command  **az policy assignment list**. 
    > **NOTE**: It will display two policies. One default that is automatically provided by Azure itself and the other one is the one we created. <br /> On the following [link](https://github.com/Marko-Buda/nd082-Azure-Cloud-DevOps-Starter-Code/blob/master/C1%20-%20Azure%20Infrastructure%20Operations/project/starter_files/tagging-policy-screenshot.JPG) you can view the screenshoot of the output of that command.

### Dependencies
1. Create an [Azure Account](https://portal.azure.com) 
2. Install the [Azure command line interface](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest)
3. Install [Packer](https://www.packer.io/downloads)
4. Install [Terraform](https://www.terraform.io/downloads.html)

### Instructions

1. Before building a packer image please create a resources group with the following command **az group create -l (location of region for deployment of virtual machines) -n (the name of the resource group)** 
    > **NOTE:** The name of the resource group set here is the one that will be used during the build of packer template and the deployment of terraform template. 
2. Run command  **packer validate** to check that no syntax errors are present.
3. Run **packer build** and wait for the build to finish with message:
    > Build 'azure-arm' finished after 5 minutes 23 seconds.<br />
==> Wait completed after 5 minutes 23 seconds<br />
==> Builds finished. The artifacts of successful builds are:<br />
--> azure-arm: Azure.ResourceManagement.VMImage:<br /> <br />
    **NOTE:**  Additionaly if the user wants to compare his output with the one here, he can do so by looking at following screenshots: [packer_part1](https://github.com/Marko-Buda/nd082-Azure-Cloud-DevOps-Starter-Code/blob/master/C1%20-%20Azure%20Infrastructure%20Operations/project/starter_files/packer_build_output_part1.png) and [packer_part2](https://github.com/Marko-Buda/nd082-Azure-Cloud-DevOps-Starter-Code/blob/master/C1%20-%20Azure%20Infrastructure%20Operations/project/starter_files/packer_build_output_part2.png)
4. Go to Azure portal and check that a image named _"UbuntuPackerImage"_ is created under resource group _"project-one-resource-group"_.
5. Return to terminal.
6. Run **terraform validate** to check that no syntax errors are present.
7. Run **terraform plan** and enter the number of Virtual Machines that you want to deploy and the location of their deployment.

    > **NOTE**: The location of VM deployment must be the same as the one set in packer image. Otherwise expect terraform to return an error regarding the wrongly set location.<br /> This command creates an execution plan. It will tell you the number of resources that are going to be created.

8. If no error appears in the previous step run **terraform apply** command and wait for it to finish deployment (this usually take several minutes).
    > **NOTE:** If an error "cannot create an already existing resource group" appears, please run the following command **_terraform import azurerm_resource_group.main /subscriptions/"subscription-id"/resourceGroups/"resource_group_name"_**. <br />
    This command links resource group that is created on azure portal with the one in which we want to deploy our resources to.<br /> Repeat this instruction step 8.

#### User Modifications 
* User can modify the input arguments during the instructions step 7 by modifying default value of arguments in [vars.tf](https://github.com/Marko-Buda/nd082-Azure-Cloud-DevOps-Starter-Code/blob/master/C1%20-%20Azure%20Infrastructure%20Operations/project/starter_files/vars.tf) file.
* This file contains all the user input variables that can be changed from the password used to login into virtual machine to project name listed in tags variable.
* To change, for example project name, user can either hard-code a new value instead of the one currently set or he can completely remove the _default_ atribute. This would prompt an input request for project name from user when step 7 was repeated.
* If the user wants to avoid setting inputs he can do so by adding _default =_ "string" inside _variable_ brackets.


### Output
After you succesfully deploy your IaaS web server you should receive the following message:
> Apply complete! Resources: 19 added, 0 changed, 0 destroyed.

The 19 added resources are total number of the resources that were created when two Virtual Machines were deployed to Azure.

The expected output of terraform plan can be viewed on this [link](https://github.com/Marko-Buda/nd082-Azure-Cloud-DevOps-Starter-Code/blob/master/C1%20-%20Azure%20Infrastructure%20Operations/project/starter_files/solution.plan).

For additional check to see if you have built everything correctly you can compare your output with ones listed here: [terraform_part1](https://github.com/Marko-Buda/nd082-Azure-Cloud-DevOps-Starter-Code/blob/master/C1%20-%20Azure%20Infrastructure%20Operations/project/starter_files/terraform_apply_part1.png) and [terraform_part2](https://github.com/Marko-Buda/nd082-Azure-Cloud-DevOps-Starter-Code/blob/master/C1%20-%20Azure%20Infrastructure%20Operations/project/starter_files/terraform_apply_part2.png). 