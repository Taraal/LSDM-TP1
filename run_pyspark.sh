#!/bin/bash

## En local ->
## pig -x local -

## en dataproc...

## copy data
gsutil cp small_page_links.nt gs://scorfa_data_bucket/

## copy pig code
gsutil cp pagerank-notype.py gs://scorfa_data_bucket/

## Clean out directory
gsutil rm -rf gs://scorfa_data_bucket/out


## create the cluster
## machines n1-standard-2 pour empêcher le dépassement de quotas Gcloud
gcloud dataproc clusters create cluster-a35a --enable-component-gateway --region europe-west1 --zone europe-west1-c --master-machine-type n1-standard-2 --master-boot-disk-size 500 --num-workers 2 --worker-machine-type n1-standard-2 --worker-boot-disk-size 500 --image-version 2.0-debian10 --project master-2-large-scale-data


## run
## (suppose that out directory is empty !!)
gcloud dataproc jobs submit pyspark --region europe-west1 --cluster cluster-a35a gs://scorfa_data_bucket/pagerank-notype.py  -- gs://scorfa_data_bucket/small_page_links.nt 3

## access results
gsutil cat gs://scorfa_data_bucket/out/pagerank_data_10/part-r-00000

## delete cluster...
gcloud dataproc clusters delete cluster-a35a --region europe-west1

