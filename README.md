# tsne operator

#### Description
`tsne` operator performs tSNE analysis.

##### Usage
Input projection|.
---|---
`row`   | represents the variables (e.g. genes, channels, markers)
`col`   | represents the observations (e.g. cells, samples, individuals) 
`y-axis`| measurement value


Input parameters|.
---|---
`dims`   | logical, output dimensionality, default 2
`initial_dims`   | numeric, the number of dimensions that should be retained in the initial PCA step, default 50
`perplexity`| numeric, perplexity parameter, default is 30
`theta`| numeric, speed/accuracy trade-off (increase for less accuracy), set to 0.0 for exact TSNE, default 0.05
`pca`| numeric, whether an initial PCA step should be performed, default `TRUE`
`max_iter`| numeric, number of iteration, default 1000
`pca_center`| logical, should data be centered before pca is applied ?
`pca_scale`| logical, should data be scaled before pca is applied ?
`stop_lying_iter`| numeric, Iteration after which the perplexities are no longer exaggerated
`mom_switch_iter`| numeric, Iteration after which the final momentum is used


Output relations|.
---|---
`tsne1, tsne2`| first two components containing the new projected values


##### Details
The operator performs tSNE analysis. It reduces the amount of variables (i.e. indicated by rows) to a lower number (default 2).


#### Reference

##### See Also


#### Examples
