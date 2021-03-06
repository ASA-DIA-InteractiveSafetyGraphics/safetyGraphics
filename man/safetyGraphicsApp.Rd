% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/safetyGraphicsApp.R
\name{safetyGraphicsApp}
\alias{safetyGraphicsApp}
\title{Run the interactive safety graphics app}
\usage{
safetyGraphicsApp(
  domainData = list(labs = safetyData::adam_adlbc, aes = safetyData::adam_adae, dm =
    safetyData::adam_adsl),
  meta = safetyGraphics::meta,
  charts = NULL,
  mapping = NULL,
  filterDomain = "dm",
  chartSettingsPaths = NULL
)
}
\arguments{
\item{domainData}{named list of data.frames to be loaded in to the app. Sample AdAM data from the safetyData package used by default}

\item{meta}{data frame containing the metadata for use in the app. See the preloaded file (\code{?safetyGraphics::meta}) for more data specifications and details. Defaults to \code{safetyGraphics::meta}.}

\item{charts}{data.frame of charts to be used in the app}

\item{mapping}{data.frame specifying the initial values for each data mapping. If no mapping is provided, the app will attempt to generate one via \code{detectStandard()}}

\item{filterDomain}{domain used for the data/filter tab. Demographics ("\code{dm}") is used by default. Using a domain that is not one record per participant is not recommended.}

\item{chartSettingsPaths}{path(s) where customization functions are saved relative to your working directory. All charts can have itialization (e.g. myChart_Init.R) and static charts can have charting functions (e.g. myGraphic_Chart.R).   All R files in this folder are sourced and files with the correct naming convention are linked to the chart. See the Custom Charts vignette for more details.}
}
\description{
Run the interactive safety graphics app
}
