# rkipcreg

This repo contains the code for reproducing the figures and tables in the poster titled:

**Co-regulation of RKIP and autophagy genes by VEZF1 and ERCC6 in prostate cancer**

## Docker environment

```bash
$ docker pull bcmslab/cregart:20181219
$ docker run -it bcmslab/cregart:20181219 bash
```

## Intiating the code

```
$ git clone https://github.com/MahShaaban/rkipcreg
$ cd rkipcreg
$ make
```

Parts of the work presented in this poster were published in the following two articles:
* Ahmed, M., Lai, T., Zada, S., Hwang, J., Pham, T., Yun, M., & Kim, D. (2018). 
Functional Linkage of RKIP to the Epithelial to Mesenchymal Transition and Autophagy during the Development of Prostate Cancer. 
Cancers, 10(8), 273. https://doi.org/10.3390/cancers10080273
* Article: cRegulome: An R package for accessing microRNA and transcription factor-gene expression correlations in cancer (in press)
