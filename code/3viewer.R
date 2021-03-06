```

## Viewing Displays ##

### Trelliscope Viewer ###

<div class="alert alert-warning">This section is based on an older version of the Trelliscope Viewer.</div>

The Trelliscope viewer we have encountered throughout this document is a server-side web viewer that uses [Shiny](http://www.rstudio.com/shiny/).  Shiny basically provides a live R session running behind the web viewer, facilitating all of the interaction.

The viewer is a work in progress.  There are many possible features.

Below we describe some of the components of the viewer.

#### Panel View

This is the main component of the viewer.  Once you have selected a display to view, the panel view tiles the panels of the chosen display and allows you to page through them.  Left and right keys or the buttons on the header bar page through panels.  The text box at the top of the window specifies (approximately) how many panels to tile across the screen (exact number is based on the aspect ratio of the panels).

#### "View" Modal

Click the "view" button.  You can specify which cognostics to display below each panel.  The second tab, "plotFn" will let you change the plot function applied to each subset (this only works when `storage` is "localData"` or `"rhipeData"`.

#### "Cognostics" Modal

Here, you can sort and filter the panels based on their cognostics.  Click the histograms to get an interactive histogram with which you can specify a range.  On the multivariate selection row, click and drag table cells to specify all variables you want to do multivariate filtering on.  If you choose 2 variables, you are given an interactive scatterplot on which you can select ranges to filter on.  If you select more than 2 variables, you get a bivariate view of a projection pursuit to filter on (actual filtering in this case doesn't work right now).  I need to give some more thought to making this interface optimal.  The load, save, reset filter settings don't work right now.  When you leave this modal, you go back to panel view with the panels arranged according to what you did in the cognostics panel.

#### Changing the Display

This is available as first menu item in the display button dropdown.  It simply brings up a modal that lets you select a different display to view.

#### Adding a Related Display

Displays with the same set of keys can have their panels displayed together.  (When a display is created, a hash is made of the sorted unique panel keys.  If two displays have the same hash, it means that they have the exact same collection of panel keys).

As an example, change the display to "airTemp_vs_date".  Then select "Add Related" from the "Display" button dropdown and select "lat_vs_lon".  Now you can view the movement of the buoy in association with the time series plots, and filter these to explore whether the lat/lon binning looks valid.

#### Keyboard Shortcuts

There are some keyboard shortcuts for convenience:

- **"c"**: open cognostics modal
- **"v"**: open view modal
- **"d"**: open display modal
- **"r"**: open related displays modal
- **esc**: leave a modal and return to panel view

<!-- #### To Come

- A dropdown for each column (variable) in the cognostics table with options to:
  - apply a transformation to the variable
  - randomly sample displays to view across the distribution of this variable
  - if a continuous variable, discretize into bins
- A collapsible sidebar in the panel view that allows you to see where specified cognostics for the panels currently being viewed lie with respect those cognostics of all panels - either in a univariate or bivariate view
- Ability to specify panel-to-panel relationships within and between displays through cognostics, specified with something like `"group1/name1/key1;group2/name2/key2"`
- Add an interactive network graph using d3 for panel-to-panel relationships, used to select panels of interest
- Multi-user per-panel input / user "authentication"
- ... -->

### Cognostics Interactions ###

The current viewer is a proof-of-concept, and I'd like to see much more functionality here in the future.  In particular, the following are interactive filtering / sorting behaviors we would like to see for each cognostics type:

- **Numeric**: filter / expore by univariate quantile plot / histogram - for groups of numeric variables, filter by scatterplot
- **Factor (Categorical)**: filter / explore by dropdown of categories, frequency bar chart, regular expression input
- **Date/time**: filter / explore by time window slider, time of day, day of week, calendar range, regular expression input
- **Geo**: filter / explore by lat/lon projected onto map
- **Relation**: specified by a list of keys pointing to other subsets (within same dataset or in others) - filter / explore by node groupings in a network graph which might be organized or colored by other cognostics variables
- **Hierarchy**: a label that is found in a hierarchy specified externally to the record (in a separate metadata file) - filter / explore by treemap, etc.

Filters and interactivity based on combinations of cognostics would also be desirable, such as a numeric cognostic plotted versus a time cognostic as a time series, etc.

