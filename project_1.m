clear all
close all
clc

images = loadMNISTImages('train-images.idx3-ubyte');
test_images = loadMNISTImages('t10k-images.idx3-ubyte');
labels = loadMNISTLabels('train-labels.idx1-ubyte');
test_labels = loadMNISTLabels('t10k-labels.idx1-ubyte');
images = images';
test_images = test_images';

labels(labels == 0) = 10;
test_labels(test_labels == 0) = 10;
labelsd = dummyvar(labels);
labelsd = labelsd';
test_labelsd = dummyvar(test_labels);
test_labelsd = test_labelsd';

padsize = [0 4];

images_padded = padarray(images,padsize,'post');
test_images_padded = padarray(test_images,padsize,'post');
images_padded = images_padded';
test_images_padded = test_images_padded';
images = images';
test_images = test_images';

HD = hadamard_make(788);

images_reduced = HD*images_padded;
test_images_reduced = HD*test_images_padded;