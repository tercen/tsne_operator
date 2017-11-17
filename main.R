library(tercen)
library(dplyr)
library(reshape2)
library(Rtsne)

# Sets seed for reproducibility
set.seed(42)

(ctx = tercenCtx())  %>% 
  select(.cindex, .rindex, .y) %>% 
  reshape2::acast(.cindex ~ .rindex, value.var='.y', fun.aggregate=mean) %>%
  Rtsne::Rtsne(dims = as.integer(ctx$op.value('dims')),
               initial_dims = as.integer(ctx$op.value('initial_dims')),
               perplexity = as.integer(ctx$op.value('perplexity')),
               theta = as.double(ctx$op.value('theta')),
               check_duplicates = FALSE,
               pca=as.logical(ctx$op.value('pca')), 
               max_iter = as.integer(ctx$op.value('max_iter')),
               pca_center=as.logical(ctx$op.value('pca_center')), 
               pca_scale=as.logical(ctx$op.value('pca_scale')), 
               stop_lying_iter = as.integer(ctx$op.value('stop_lying_iter')),
               mom_switch_iter = as.integer(ctx$op.value('mom_switch_iter')),
               momentum = as.double(ctx$op.value('momentum')),
               final_momentum = as.double(ctx$op.value('final_momentum')),
               eta = as.double(ctx$op.value('eta')),
               exaggeration_factor = as.double(ctx$op.value('exaggeration_factor'))
               ) %>%
  (function(tsne) {
    d = as_tibble(tsne$Y)
    names(d)=paste('tsne', seq_along(d), sep = '.')
    return(d)
  }) %>% 
  mutate(.cindex = seq_len(nrow(.))-1) %>%
  ctx$addNamespace() %>%
  ctx$save()