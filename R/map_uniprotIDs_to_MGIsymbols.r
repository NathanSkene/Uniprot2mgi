#' map_uniprotIDs_to_MGIsymbols
#'
#' \code{filter.genes.without.1to1.homolog} Takes an array of Uniprot IDs, returns the equivilent gene symbols
#'
#' @param uniprot_ids Array of uniprot IDs
#' @return Array of gene symbols where each position equates to that in the inputs
#' @examples
#' map_uniprotIDs_to_MGIsymbols(uniprot_ids=c("Q05CX3","B1AR31","A1ILG8"))
#' @export
#' @import data.table
map_uniprotIDs_to_MGIsymbols <- function(uniprot_ids){
  library(data.table)
  data(uniprot_2_mgi)
  data(mgi_ids_2_syms)
  uniprot_2_mgi = unique(uniprot_2_mgi[,c("Entry","MGIid")])
  colnames(mgi_ids_2_syms)[1] = "MGIid"
  uniprot_2_symbols = merge(uniprot_2_mgi,mgi_ids_2_syms)
  uniprot_2_symbols = unique(uniprot_2_symbols[,c("Entry","mgi_symbol")])
  rownames(uniprot_2_symbols) = uniprot_2_symbols$Entry
  symbolList = as.character(uniprot_2_symbols[uniprot_ids,]$mgi_symbol)
  return(symbolList)
}
