# Fortran-labs

## The problem

Solve 1-dimensional heat transmission equation using Finite Difference Method.

![Equations](http://www.sciweavers.org/upload/Tex2Img_1525106848/render.png)


## Compilation

Compilation is done using gfortran. To compile, type ``` $ make``` in root directory.

You may want to specify precision of real numbers used (K = 1,2,3,4,8,16)
```
$ make clean
$ make K=4
```
## Running

To run the program, type ``` $ ./fdm N ```
where N is the resolution of the computation. You may also use ``` $ make test ```
To run program several times and put results to result.txt

## Charts

More of them sit in charts/ directory.

![Chart1](https://github.com/karolBak/Fortran-labs/blob/master/charts/n200k8.png)
![Chart2](https://github.com/karolBak/Fortran-labs/blob/master/charts/n1000k4.png)
