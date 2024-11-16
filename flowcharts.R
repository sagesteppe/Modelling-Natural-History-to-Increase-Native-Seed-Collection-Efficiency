library(DiagrammeR)
library(tidyverse)

setwd('~/Documents/assoRted/NAA_talk/scripts')

grViz(
  diagram = 
    "digraph flowchart {
        # define node aesthetics
        graph [fillcolor = red]
        edge [color = '#7C77B9']
        node [fontname = Helvetica, shape = rectangle, fontcolor = transparent, arrowhead = none]
        bgcolor = transparent
      
        tab1 [label = '@@1', style = filled, fillcolor = '#426B69']
        tab2 [label = '@@2', style = filled, fillcolor = '#426B69']
        tab3 [label = '@@3', style = filled, fillcolor = '#426B69']
        tab4 [label = '@@4', style = filled, fillcolor = '#426B69']
        tab5 [label = '@@5', style = filled, fillcolor = '#426B69']
        
        # set up node layout
        tab1 -> tab2 [label = '  idigbio::herbaria\n rgbif::GBIF\n  rgbif::iNaturalist\n  bien::FIA (USFS)\n  AIM (BLM)', fontcolor = white, penwidth = 3]
        tab2 -> tab3 [label = '  Drop Duplicates\n  Geolocation\n Environmental Flags\n Manual Review \n Generate pseudoabesences \n MASS::Linear-Discriminant Analysis',  fontcolor = white, penwidth = 3]
        tab3 -> tab4 [label = '  boruta::Boruta Analysis\n vif::Variance Inflation (Stepwise) \n caret::Recursive Feature Elimination \n', fontcolor = white, penwidth = 3]
        tab4 -> tab5 [label = '  randomForest::Random Forest\n  terra::predict', fontcolor = white, penwidth = 3]
        }
        
        [1]: 'Data Mining'
        [2]: 'Data Cleaning'
        [3]: 'Variable Selection'
        [4]: 'Model & Predict'
        [5]: 'Communicate'

        ") %>%  
  DiagrammeRsvg::export_svg() %>%
  charToRaw %>% 
  rsvg::rsvg_png("../images/SDM_flowchart.png")



grViz(
  diagram = 
    "digraph flowchart {
        # define node aesthetics
        graph [fillcolor = red]
        edge [color = '#7C77B9']
        node [fontname = Helvetica, shape = rectangle, fontcolor = transparent, arrowhead = none]
        bgcolor = transparent
      
        tab1 [label = '@@1', style = filled, fillcolor = '#426B69']
        tab2 [label = '@@2', style = filled, fillcolor = '#426B69']
        tab3 [label = '@@3', style = filled, fillcolor = '#426B69']
        tab4 [label = '@@4', style = filled, fillcolor = '#426B69']
        tab5 [label = '@@5', style = filled, fillcolor = '#426B69']
        
        # set up node layout
        tab1 -> tab2 [label = '  idigbio::herbaria', fontcolor = white, penwidth = 3]
        tab2 -> tab3 [label = '  Drop Duplicates & Geolocation\n Environmental Flags\n Manual Review \n PCA (GDD surface) \n  hclustgeo::ward-like hierarchial clustering \n phenesse::weibull event start/ends\n Generate pseudoabesences \n fields::thin plate spline (clean absences)',  fontcolor = white, penwidth = 3]
        tab3 -> tab4 [label = ' \n caret::Recursive Feature Elimination\n', fontcolor = white, penwidth = 3]
        tab4 -> tab5 [label = ' mgcv::GAM \n MuMIn::GAM with spatial autocorrelation \n MuMIn::dredge converged  models', fontcolor = white, penwidth = 3]
        }
        
        [1]: 'Data Mining'
        [2]: 'Data Cleaning'
        [3]: 'Variable Selection'
        [4]: 'Model & Predict'
        [5]: 'Communicate'

        ") %>%  
  DiagrammeRsvg::export_svg() %>%
  charToRaw %>% 
  rsvg::rsvg_png("../images/Phenology_flowchart.png")


grViz(
  diagram = 
    "digraph flowchart {
        # define node aesthetics
        graph [fillcolor = red]
        edge [color = '#7C77B9']
        node [fontname = Helvetica, shape = rectangle, fontcolor = transparent, arrowhead = none]
        bgcolor = transparent
      
        tab1 [label = '@@1', style = filled, fillcolor = '#426B69']
        tab2 [label = '@@2', style = filled, fillcolor = '#426B69']
        tab3 [label = '@@3', style = filled, fillcolor = '#426B69']
        
        # set up node layout
        tab1 -> tab2 [label = '  terra::mask SDM rasters >80% prob\n  terra::divide patches `along` basins\n  identify populated patches (w/ probs >55%)', fontcolor = white, penwidth = 3]
        tab2 -> tab3 [label = '  spdep::nglag find all patches w/in 5 neighbors\n spdep::dnearneigh find all patches within 5k',  fontcolor = white, penwidth = 3]
        
    }
        [1]: 'Data Processing'
        [2]: 'Classify'
        [3]: 'Communicate'
        
        ") %>%  
  DiagrammeRsvg::export_svg() %>%
  charToRaw %>% 
  rsvg::rsvg_png("../images/Patches_flowchart.png")
