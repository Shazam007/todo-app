# Todo App

This application is built using Next.js, with infrastructure automation managed by Terraform and the CI/CD pipeline implemented using GitHub Actions. The following instructions will guide you through setting up the project, initializing the infrastructure, and running the CI/CD pipeline.


## Used tools and technologies

- Next.js 
- Google Cloud Platform
- Terraform (v1.8.3)
- Docker
- Github Actions


## Branches

[![Main Branch](https://img.shields.io/badge/main-blue)](https://github.com/Shazam007/todo-app/tree/main)

[![Experiment Branch](https://img.shields.io/badge/devops/exp_one-experiment-yellow)](https://github.com/Shazam007/todo-app/tree/devops/exp-one)


## Installation

1. Clone the repository 

1. Create the backend bucket in GCP to store `tfstate` file

    * Create a bucket with GCP Cloud Storage service
    * Retrieve the bucket ID and add it to the `terraform/backend.tf` configuration file.

3. Run terraform configuration
    * Initialize Terraform in `terraform` directory.
        ```bash
        terraform init
        ```
    * Update the necessary information such as `project_id`, `region`, `service_name`, `initial_image_url` in `variables.tf` file. 
    * Run the terraform file
        ```bash
        terraform plan
        terraform apply
        ```
    * above step will create following resources
        * Enable APIs in cloud project
        * Create cloud run service account
        * Attach the required roles to the service account
        * Create the artifact repository
        * Generate the service account key
        * Create initial cloud run v2 service with a placeholder image

4.  Retrieve the service account key
    * After executing the terraform configuration, get the SA key using,
        ```bash
        terraform output -json
        ```
5.  Add Secrets to GitHub
    * Add the generated service account key to GitHub secrets as `GCP_SA_KEY`.
    * Add the project ID to GitHub secrets as `GCP_PROJECT_ID`.

6.  Edit the Workflow File
    * Change the target push branch as required
    * Add the terraform step output repository ID to `DOCKER_REPOSITORY_ID`
    * Add previously created `CLOUD_RUN_SERVICE_NAME`
    * Change the docker image name if required with `DOCKER_IMAGE_NAME`
    * Add the region to `GCP_REGION`

7. Commit changes and push to the repository.

## Getting Started with nextjs application - previous documentation

This is a [Next.js](https://nextjs.org/) project bootstrapped with [`create-next-app`](https://github.com/vercel/next.js/tree/canary/packages/create-next-app).

First, run the development server:

```bash
npm run dev
# or
yarn dev
# or
pnpm dev
# or
bun dev
```

Open [http://localhost:3000](http://localhost:3000) with your browser to see the result.

You can start editing the page by modifying `app/page.tsx`. The page auto-updates as you edit the file.

This project uses [`next/font`](https://nextjs.org/docs/basic-features/font-optimization) to automatically optimize and load Inter, a custom Google Font.

## Learn More

To learn more about Next.js, take a look at the following resources:

- [Next.js Documentation](https://nextjs.org/docs) - learn about Next.js features and API.
- [Learn Next.js](https://nextjs.org/learn) - an interactive Next.js tutorial.

You can check out [the Next.js GitHub repository](https://github.com/vercel/next.js/) - your feedback and contributions are welcome!

## Deploy on Vercel

The easiest way to deploy your Next.js app is to use the [Vercel Platform](https://vercel.com/new?utm_medium=default-template&filter=next.js&utm_source=create-next-app&utm_campaign=create-next-app-readme) from the creators of Next.js.

Check out our [Next.js deployment documentation](https://nextjs.org/docs/deployment) for more details.
