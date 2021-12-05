# rule for making report 
report:Rmd_Report/Vacc_report.Rmd  figure/figure1.png
	Rscript -e "rmarkdown::render('Rmd_Report//Vacc_report.Rmd', quiet = TRUE,output_file = '../output/report.html')"

# rule for ploting the figure1
figure/figure1.png: R/make_figure1.R data/vaccine_output.csv
	chmod +x R/make_figure1.R && \
	Rscript R/make_figure1.R


# rule for cleaning data
data/vaccine_output.csv: R/data_processing.R data/vaccination-data.csv   
	chmod +x R/data_processing.R  && \
	Rscript R/data_processing.R 


.PHONY: report

# document help info
.PHONY: help
help:
		@echo "report: Generate final analysis report."
		@echo "vaccine_output.csv: process raw data."
		@echo "fig1.png: Make a map plot of vaccines acorss countries."

