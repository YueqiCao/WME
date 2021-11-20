# WME
## An efficient algorithm to estimate the Weingarten map for submanifold point clouds

This readme page contains a basic documentation for the WME matlab code repository. We duplicate some information that can be found by help command in matlab. To quickly look at examples in matlab, first run 
```matlab
addPathToMatlab
```
to add all WME files to matlab path. Then use 
```matlab
help WME_function_name
```
to see the documentation for this function. 

We also published tutorials for all WME functions. A complete list can be found in the following

### WME_data

- [WME_torus](http://htmlpreview.github.io/?https://github.com/YueqiCao/WME/blob/main/tutorial/html/WME_torus_tt.html): generate random points from 2-dimensional torus 
- [WME_ellipsoid](http://htmlpreview.github.io/?https://github.com/YueqiCao/WME/blob/main/tutorial/html/WME_ellipsoid_tt.html): generate random points from ellipsoids in various dimension (max dimension is 4)
- [WME_read_data](http://htmlpreview.github.io/?https://github.com/YueqiCao/WME/blob/main/tutorial/html/WME_read_data_tt.html): read point clouds in various data type (support .mat, .txt, .ply)

### WME_main

- [WME_tangent_spaces](http://htmlpreview.github.io/?https://github.com/YueqiCao/WME/blob/main/tutorial/html/WME_tangent_spaces_tt.html): Estimate tangent/normal spaces for submanifold point cloud data using local PCA
- [WME_orient_nom](http://htmlpreview.github.io/?https://github.com/YueqiCao/WME/blob/main/tutorial/html/WME_orient_nom_tt.html): Orient the normal vectors to get a consistent global normal vector field on manifold
- [WME_wgtmap](http://htmlpreview.github.io/?https://github.com/YueqiCao/WME/blob/main/tutorial/html/WME_wgtmap_tt.html): Estimate the Weingarten map for submanifold point cloud data
- [WME_mean_curv](http://htmlpreview.github.io/?https://github.com/YueqiCao/WME/blob/main/tutorial/html/WME_mean_curv_tt.html): Estimate the mean vector field on submanifold point cloud data
  
### WME_draw

- [WME_draw_points](http://htmlpreview.github.io/?https://github.com/YueqiCao/WME/blob/main/tutorial/html/WME_draw_points_tt.html): scatter point clouds
- [WME_draw_planes](http://htmlpreview.github.io/?https://github.com/YueqiCao/WME/blob/main/tutorial/html/WME_draw_planes_tt.html): draw tangent planes for point clouds
- [WME_draw_normals](http://htmlpreview.github.io/?https://github.com/YueqiCao/WME/blob/main/tutorial/html/WME_draw_normals_tt.html): draw normal vectors on point clouds

## Cite 
Please cite the reference:
> Yueqi Cao, Didong Li, Huafei Sun, Amir Assadi, Shiqiang Zhang. _Efficient Weingarten Map and Curvature Estimation on Manifolds_ Mach Learn 110, 1319–1344 (2021). [https://doi.org/10.1007/s10994-021-05953-4](https://doi.org/10.1007/s10994-021-05953-4)

## Contact
Email: bityueqi@gmail.com
