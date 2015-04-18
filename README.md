# comp-init
A bash startup script for configuring a Google Compute Engine Debian instance as a developer environment for working with Google Cloud Platform. This is useful where you need to regularly spin up instances for development and testing as an alternative to using your own local machine. The script will setup an environment for developing both Java and Python projects.

###Software
The script installs the following software (and dependencies) on first use:
* Zip
* Git
* MySQL client
* Open JDK 7
* Gradle 2.3 (the version can be configured in the script)
* Google App Engine Java & Python SDKs
* pip
* pylint
* pep8
* pyopenssl
* +dependancies

<hr>

###Requirements
The script should work on a variety of systems but is specifically intended and tested to run as a startup script for a Google Compute Engine instance and assumes:

* a Debian 7 Wheezy base image
* the Cloud SDK is pre-installed (this is the case on standard GCE images)

<hr>

###Usage
A copy of the script is publically hosted on Google Cloud Storage. To configure an instance to use it you will need to manually set a metadata key value pair in the Google Developer Console when creating the instance:

key: startup-script-url

value: gs://startup-scripts-compute/dev_setup.sh

You can also do this via the command line using the [Cloud SDK](https://cloud.google.com/sdk/):
```shell
gcloud compute instances create <INSTANCE_NAME> --metadata startup-script-url=gs://startup-scripts-compute/dev_setup.sh
```
Alternatively if you would like to [host a customised copy] (https://cloud.google.com/compute/docs/startupscript) of the script then you can upload it to Google Cloud Storage in your own projects.

The script will take several minutes to complete and if you login too early you may need to manually apply the update to your PATH:

```shell
source /etc/profile.d/env_vars.sh
```
Alternatively you can log out and back in again to apply the path. Once the script has completed your path will be automatically updated each time you login.

To use most Google Cloud Platform services you will also need to login to the Cloud SDK via OAuth 2

```shell
gcloud auth login
```
Warning: You should only do this in projects where you are the only person with permissions. Carefully read the warning presented when running this command.
