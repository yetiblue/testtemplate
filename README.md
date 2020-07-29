# Pear Code Template

## Introduction
This is a template for use in developing future Pear Code applications.

Pear Code applications generally use python/django for API development,
and Vue for frontend app development. While developers are encouraged to use the
best tool for the job, often times that's whatever tool everyone else is using.

To facilitate work with these common tools, this template has been built to
scaffold out a new project.

NOTE: This introduction is specific to the pear code template. The remainder of this
README can be used as a jumping off point for individual project documentation.

## Requirements
Developer environments require:
- A locally installed IDE or text editor for working with code
- Docker and Docker compose installed

## Usage
To start a new project, first clone this repository locally. Generally, Pear Devs
keep their Pear-adjacent projects within a directory called `pear` within their home
directory. The following steps (replace `MYPROJECT` with your project name) will
create a new project within your home directory and get it up and running:
```
mkdir -p ~/pear
cd ~/pear
git clone https://github.com/pearcode/template.git MYPROJECT
cd MYPROJECT
rm -rf .git
git init
git add --all :/
git commit -m "Initial Commit"
docker-compose up --build
```
