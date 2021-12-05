
Covid-19 Vaccination project
 =====
 
Introduction and preparation
----

For my project, I will analyze the Covid-19 vaccination data across different countries. Exploratory analysis including summary statistics characterization and data visualization will be performed on the data.
To analyze the data,you would need `Dokcer` software and `R` version later than 4.0  


**Docker Image **

All the required packages have been packed within my Docker image.

```
## Pull the image into local.
docker pull tingyhu/my_project
```


Execute the analysis
------

**1. Clone the project to local**

```
# Clone the project to local
git clone https://github.com/tingyhu45/info_final.git
```

**2. Mount the output to local directory**

You need to create a new directory locally and then mount the output file from image to local.

```
# create a local directory for mounting
mkdir {your_pwd}/docker_output


# mount the output directory to local and get access to the image
cd {your_pwd}/info550_final
docker run -v {your_pwd}/docker_output:/project/output -it tingyhu/my_project
```

**3. Produce the result**

```
# go to the project folder under docker 
cd project

# generate the report
make report

# exit the docker image
exit
```

**4. Examine the report locally**
The final report named Vacc_report.html that contain the results has been created in your local folder , which can be open with:

```
open {your_pwd}/docker_output/report.html
```





