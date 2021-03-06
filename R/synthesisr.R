#' synthesisr: Import, assemble, and deduplicate bibiliographic datasets
#'
#'  Systematic review searches include multiple databases
#'  that export results in a variety of formats with overlap in
#'  coverage between databases. To streamline the process of importing,
#'  assembling, and deduplicating results, synthesisr recognizes
#'  bibliographic files exported from databases commonly used for
#'  systematic reviews and merges results into a standardized format.
#'
#' @section Import & Export:
#' The key task performed by \code{synthesisr} is flexible import and presentation of bibliographic data. This is typically achieved by \code{\link{read_refs}}, which can import multiple files at once and link them together into a single \code{data.frame}. Conversely, export is via \code{\link{write_refs}}. Users that require more detailed control can use the following functions:
#' \itemize{
#'   \item \code{\link{detect_}} Detect file attributes
#'   \item \code{\link{parse_}} Parse a vector containing bibliographic data
#'   \item \code{\link{clean_}} Cleaning functions for author and column names
#'   \item \code{\link{code_lookup}} A dataset of potential ris tags
#' }
#'
#' @section Data formatting:
#' \itemize{
#'   \item \code{\link{bibliography-class}} Methods for class 'bibliography'
#'  \item \code{\link{merge_columns}} rbind two data.frames with different numbers of columns
#'  \item \code{\link{format_citation}} Return a clean citation from a bibliography or data.frame
#'  \item \code{\link{add_line_breaks}} Set a maximum character width for strings
#'}
#'
#' @section Deduplication:
#' When importing from multiple databases, it is likely that there will be duplicates in the resulting dataset. The easiest way to deal with this problem in \code{synthesisr} is using the \code{\link{deduplicate}} command; but this can be risky, particularly if there are no DOIs in the dataset. To get finer control of the deduplication process, consider using the sub-functions:
#'\itemize{
#'   \item \code{\link{find_duplicates}} Locate potentially duplicated references
#'   \item \code{\link{extract_unique_references}} Return a data.frame with only 'unique' references
#'   \item \code{\link{review_duplicates}} Manually review potential duplicates
#'   \item \code{\link{override_duplicates}} Manually override identified duplicates
#'   \item \code{\link{fuzz_}} Fuzzy string matching c/o 'fuzzywuzzy'
#'   \item \code{\link{string_}} Fuzzy string matching c/o \code{stringdist}
#'}
#'
#' @docType package
#' @name synthesisr

# quiet no visible binding NOTEs
if(getRversion() >= "2.15.1")  utils::globalVariables(c("."))

#' @useDynLib
#' @importFromRcpp sourceCpp
