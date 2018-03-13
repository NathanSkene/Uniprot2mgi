#' Uniprot 2 MGI
#'
#' A dataset obtained from Uniprot mapping each Swissprot/Trembl ID onto the equivilent MGI ID
#'
#' @source
#' The code to prepare the .Rda file file from the marker file is:
#' \code{
#' library("biomaRt")
#' mouse = useMart(host="www.ensembl.org", "ENSEMBL_MART_ENSEMBL", dataset = "mmusculus_gene_ensembl")
#' attrib_mus = listAttributes(mouse)
#' mgi_symbols = getBM(attributes=c("mgi_id"), mart=mouse)
#' mgi_syms = getBM(attributes=c("mgi_id","mgi_symbol"), mart=mouse)
#' write.csv(mgi_syms,file="data/mgi_ids_to_syms.csv")
#' write.csv(mgi_symbols[,1],"mgi_ids.csv")
# These are uploaded to UNIPROTkb: https://www.uniprot.org/uploadlists/
# - Output is then downloaded
#' uniprot_2_mgi = fread("/Users/natske/Desktop/Mouse Synaptosome Project/data/uniprot-AllMGIids.tab",stringsAsFactors = FALSE)
#' uniprot_2_mgi = data.frame(uniprot_2_mgi)
#' colnames(uniprot_2_mgi)[1] = "MGIid"
#' devtools::use_data(uniprot_2_mgi,overwrite=TRUE)
#' }
#'
"uniprot_2_mgi"


#' MGI IDs to MGI symbols
#'
#' A dataset obtained from Biomart mapping MGI IDs onto MGI symbols
#'
#' @source
#' The code to prepare the .Rda file file from the marker file is:
#' \code{
#' library("biomaRt")
#' mouse = useMart(host="www.ensembl.org", "ENSEMBL_MART_ENSEMBL", dataset = "mmusculus_gene_ensembl")
#' mgi_ids_2_syms = getBM(attributes=c("mgi_id","mgi_symbol"), mart=mouse)
#' devtools::use_data(mgi_ids_2_syms,overwrite=TRUE)
#' }
#'
"mgi_ids_2_syms"
