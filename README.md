# Host a Dynamic Web App on AWS with Docker, Amazon ECR, and ECS Using Terraform

Welcome to the project repository for hosting a dynamic web application on AWS using Docker, Amazon ECR, and ECS with Terraform. This project demonstrates how to deploy a scalable and secure web application using various AWS services. Below you'll find an overview of the architecture, setup instructions, and additional details.

Using Terraform for deployment brings several significant advantages to infrastructure management, especially in cloud environments like AWS. Here’s why Terraform is crucial for modern deployment practices:

### 1. **Infrastructure as Code (IaC)**

Terraform allows you to define and manage your infrastructure using code. This approach provides several benefits:
- **Consistency:** Ensures that your infrastructure setup is consistent across different environments (e.g., development, staging, production).
- **Version Control:** Infrastructure changes can be tracked, reviewed, and versioned using Git or other version control systems.
- **Documentation:** The Terraform configuration files serve as living documentation of your infrastructure setup.

### 2. **Declarative Syntax**

Terraform uses a declarative language, meaning you describe the desired state of your infrastructure without specifying the steps to achieve that state. This makes it easier to understand and manage complex setups:
- **Simplified Management:** You only need to declare the end state you want, and Terraform handles the details of how to achieve it.
- **Predictability:** Terraform provides a plan that shows what changes will be made before applying them, reducing surprises during deployment.

### 3. **Automation**

Automating infrastructure deployment with Terraform reduces manual intervention and human error:
- **Reproducibility:** Enables the automated, repeatable creation and modification of infrastructure. You can use the same Terraform configurations to spin up identical environments quickly.
- **Scalability:** Automates the provisioning of resources based on configuration, making it easy to scale infrastructure up or down as needed.

### 4. **Multi-Cloud and Provider Support**

Terraform supports multiple cloud providers and services, not just AWS:
- **Flexibility:** Allows you to manage infrastructure across different cloud providers (e.g., AWS, Azure, Google Cloud) and on-premises environments using a single tool.
- **Unified Management:** Provides a consistent workflow for managing resources across different platforms.

### 5. **Modular and Reusable Configurations**

Terraform promotes the use of modules, which are reusable configurations that help in organizing and standardizing infrastructure code:
- **Modularity:** Breaks down complex configurations into manageable pieces. Modules can be shared and reused across different projects.
- **Best Practices:** Encourages the use of best practices and design patterns for infrastructure management.

### 6. **State Management**

Terraform maintains the state of your infrastructure in a state file:
- **Tracking:** Keeps track of resource changes and ensures that your infrastructure matches the configuration you’ve defined.
- **Rollback:** Allows you to roll back changes by reverting to a previous state if necessary.

### 7. **Collaboration and Team Efficiency**

Terraform enhances team collaboration by providing a shared and consistent approach to infrastructure management:
- **Team Collaboration:** Teams can work on the same infrastructure codebase, using version control to manage changes and reviews.
- **Change Management:** Terraform's plan and apply phases ensure that all changes are deliberate and reviewed before being executed.

### 8. **Testing and Validation**

Terraform supports testing and validation of configurations before applying changes:
- **Plan and Review:** The `terraform plan` command lets you review changes before applying them, reducing the risk of unintended modifications.
- **Validation:** Terraform can validate configurations to ensure that they are syntactically and semantically correct before deployment.

### 9. **Cost Management**

By using Terraform, you can better manage and optimize cloud costs:
- **Resource Management:** Automatically scale resources up or down based on demand, ensuring that you only pay for what you use.
- **Cost Forecasting:** Terraform configurations can help forecast costs by defining resource sizes and quantities ahead of time.

### 10. **Disaster Recovery and Compliance**

Terraform's code-based approach supports disaster recovery and compliance efforts:
- **Disaster Recovery:** Quickly recreate infrastructure in case of failure by redeploying from Terraform configurations.
- **Compliance:** Ensure that infrastructure meets compliance requirements by using code to enforce configuration standards and policies.

In summary, Terraform’s use in deployment simplifies infrastructure management, enhances consistency, automates processes, and supports best practices, making it a powerful tool for modern DevOps and cloud-native environments.

## Architecture Overview

The architecture for this project includes a range of AWS resources and services, organized into a 3-tier VPC setup:
The architecture comprises:
![Alt text](https://github.com/Jundyn/Host-a-Dynamic-Web-App-on-AWS-with-Docker-Amazon-ECR-and-ECS/blob/main/How_to_Host_a_Dynamic_Web_App_on_AWS_with_Docker_Amazon_ECR_and_Amazon_ECS.jpg)


- **Virtual Private Cloud (VPC):** 
  - **Public Subnets:** Used for infrastructure components like the NAT Gateway and Application Load Balancer.
  - **Private App Subnets:** Host web servers that serve web pages and applications securely.
  - **Private Data Subnets:** Store databases and other sensitive data.

- **Internet Gateway:** Provides internet access to instances in the VPC.

- **EC2 Instances:** Host the WordPress website, accessible via EC2 Instance Connect Endpoint.

- **Bastion Host:** Facilitates secure data migration into the RDS database and provides perimeter access control.

- **AWS Fargate:** Manages containerized applications without server management.

- **S3 Bucket:** Stores environment files.

- **Application Load Balancer:** Distributes traffic across EC2 instances in multiple availability zones for high availability.

- **Auto Scaling Group:** Automatically adjusts the number of EC2 instances to match the demand.

- **Route 53:** Manages domain name registration and DNS records.

- **Docker:** Builds Docker images with build arguments and environment variables, avoiding hardcoded sensitive information.

- **Security Groups:** Act as a network firewall to control traffic.

- **Certificate Manager:** Manages SSL/TLS certificates for secure communications.

- **SNS (Simple Notification Service):** Alerts about activities within the Auto Scaling Group.

- **EFS (Elastic File System):** Provides a shared file system.

- **RDS (Relational Database Service):** Manages the MySQL database.

- **IAM Roles:** Authenticate AWS services and allow secure access to resources.

- **Flyway:** Organizes and migrates SQL scripts securely via SSH Tunnel into MySQL RDS.

## Getting Started

### Prerequisites

1. **Terraform:** Ensure Terraform is installed on your local machine. You can download it from the [Terraform website](https://www.terraform.io/downloads.html).
2. **AWS CLI:** Install and configure the AWS CLI. Follow the [AWS CLI installation guide](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html).

### Setup Instructions

1. **Clone the Repository:**
   ```bash
   git clone <repository-url>
   cd <repository-folder>
   ```

2. **Configure Terraform:**
   - Update the `terraform.tfvars` file with your AWS credentials and configuration details.
   - Initialize Terraform:
     ```bash
     terraform init
     ```

3. **Plan the Deployment:**
   - Review the Terraform plan to ensure configurations are correct:
     ```bash
     terraform plan
     ```

4. **Apply the Terraform Configuration:**
   - Deploy the resources to AWS:
     ```bash
     terraform apply
     ```

5. **Verify the Deployment:**
   - Check the AWS Management Console for the created resources and ensure everything is set up as expected.

### Using the Web Application

1. **Access the Application:**
   - Use the domain name configured in Route 53 to access the deployed WordPress website.

2. **Monitor and Manage:**
   - Use the AWS Management Console to monitor the Auto Scaling Group, Application Load Balancer, and other services.
   - Review SNS notifications for activity alerts.

## Additional Resources

- **AWS Documentation:** [AWS Documentation](https://docs.aws.amazon.com/index.html) for guides on VPC, EC2, Auto Scaling, and other services.
- **GitHub Repository Files:** Access the repository files, including Terraform scripts, Dockerfiles, and architectural diagrams at [GitHub Repository](<repository-url>).
- **Flyway Documentation:** [Flyway Documentation](https://flywaydb.org/documentation) for information on database migrations.

## Web Page

The deployed web page is available in the ![Alt text](https://github.com/Jundyn/Host-a-Dynamic-Web-App-on-AWS-with-Docker-Amazon-ECR-and-ECS/blob/main/rentzone-webpage.png)

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request with your enhancements. Follow best practices for submitting changes and providing detailed commit messages.

## Lessons Learned

1. **Effective Docker Management:** Automation of Docker image builds and deployments to AWS ECS streamlined the process and reduced errors.
2. **Network Configuration Best Practices:** Using Terraform and AWS CloudFormation for network setup minimized manual errors and improved consistency.
3. **Security Practices:** Implementing IAM roles and avoiding root account use enhanced the security of the AWS environment.
4. **Cost Management:** Utilizing AWS cost management tools and optimizing resource usage helped control costs.

## Issues and Resolutions

- **IAM Permissions:** Managed IAM roles and policies to ensure correct permissions and avoid access issues.
- **Cost Control:** Implemented strategies to manage costs by turning off unused resources and optimizing instance usage.
- **Docker Image Management:** Addressed challenges with Docker image creation and deployment by using CI/CD pipelines.

Feel free to reach out if you have questions or need further assistance.
