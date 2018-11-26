#!/bin/bash

rm -rf *.log .vagrant *.box
vagrant up
vagrant package --output ubuntu18k8s.box
vagrant box remove jibijose/ubuntu18k8s
vagrant box add jibijose/ubuntu18k8s ubuntu18k8s.box
vagrant destroy -f
rm -rf *.log .vagrant *.box
