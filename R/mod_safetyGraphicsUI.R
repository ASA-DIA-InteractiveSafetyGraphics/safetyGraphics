#' UI for the default safetyGraphics shiny app
#'
#' @param id module ID
#' @param meta data frame containing the metadata for use in the app. See the preloaded file (\code{?safetyGraphics::meta}) for more data specifications and details. Defaults to \code{safetyGraphics::meta}. 
#' @param domainData named list of data.frames to be loaded in to the app.
#' @param mapping data.frame specifying the initial values for each data mapping. If no mapping is provided, the app will attempt to generate one via \code{detectStandard()}
#' @param standards a list of information regarding data standards. Each list item should use the format returned by safetyGraphics::detectStandard.
#'
#' @importFrom shinyjs useShinyjs
#'  
#' @export

safetyGraphicsUI <- function(id, meta, domainData, mapping, standards){
    #read css from pacakge
    ns<-NS(id)
    app_css <- NULL
    for(lib in .libPaths()){
        if(is.null(app_css)){
            css_path <- paste(lib,'safetyGraphics', 'www','index.css', sep="/")
            if(file.exists(css_path)) app_css <-  HTML(readLines(css_path))
        }
    }
    
    #script to append population badge nav bar
    participant_badge<-tags$script(
        HTML(
            "var header = $('.navbar> .container-fluid');
            header.append('<div id=\"population-header\" class=\"badge\" title=\"Selected Participants\" ><span id=\"header-count\"></span>/<span id=\"header-total\"></span></div>');"
        )
    )
    
    #app UI using calls to modules
    ui<-tagList(
        shinyjs::useShinyjs(),
        tags$head(
            tags$style(app_css),
            tags$link(
                rel = "stylesheet",
                type = "text/css",
                href = "https://use.fontawesome.com/releases/v5.8.1/css/all.css"
            )
        ),
        navbarPage(
            "safetyGraphics",
            id=ns("safetyGraphicsApp"),
            tabPanel("Home", icon=icon("home"),homeTabUI(ns("home"))),
            tabPanel("Mapping", icon=icon("map"), mappingTabUI(ns("mapping"), meta, domainData, mapping, standards)),
            tabPanel("Filtering", icon=icon("filter"), filterTabUI(ns("filter"))),
            navbarMenu('Charts', icon=icon("chart-bar")),
            tabPanel("Reports", icon=icon("file-alt"), reportsTabUI(ns("reports"))),
            navbarMenu('',icon=icon("cog"),
                tabPanel(title = "Metadata", settingsMappingUI(ns("metaSettings"))),
                tabPanel(title = "Charts", settingsChartsUI(ns("chartSettings"))),
                tabPanel(title = "Data", icon=icon("table"), settingsDataUI(ns("dataSettings")))
            )
        ),
        participant_badge
    )
    return(ui)
}
