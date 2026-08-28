## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  error = FALSE
)

## ----setup--------------------------------------------------------------------
library(glyparse)

## -----------------------------------------------------------------------------
x <- c(
  "Gal(b1-3)GalNAc(b1-",
  "(N(F)(N(H(H(N))(H(N(H))))))",
  "WURCS=2.0/3,3,2/[a2122h-1b_1-5][a1122h-1b_1-5][a1122h-1a_1-5]/1-2-3/a4-b1_b3-c1"
)
auto_parse(x)

## -----------------------------------------------------------------------------
# Single structure
iupac_condensed <- "Neu5Ac(a2-3)Gal(b1-4)[Fuc(a1-3)]GlcNAc(b1-4)Gal(b1-4)Glc(a1-"
parse_iupac_condensed(iupac_condensed)

## -----------------------------------------------------------------------------
# Multiple structures at once
glycans <- c(
  "Man(a1-3)[Man(a1-6)]Man(b1-4)GlcNAc(b1-4)GlcNAc(b1-",  # N-glycan core
  "Gal(b1-3)GalNAc(b1-",                                  # O-glycan core 1
  "Neu5Ac(a2-3)Gal(b1-3)[GlcNAc(b1-6)]GalNAc(b1-"         # O-glycan core 2
)
parse_iupac_condensed(glycans)

## -----------------------------------------------------------------------------
# The same structures in short format
iupac_short <- c(
  "Mana3(Mana6)Manb4GlcNAcb4GlcNAcb-",
  "Galb3GalNAcb-", 
  "Neu5Aca3Galb3(GlcNAcb6)GalNAcb-"
)
parse_iupac_short(iupac_short)

## -----------------------------------------------------------------------------
iupac_extended <- paste0(
  "alpha-D-Galp-(1->3)-",
  "beta-D-Galp-(1->"
)
parse_iupac_extended(iupac_extended)

## -----------------------------------------------------------------------------
iupac_compact <- "Mana1-3(Mana1-6)Manb1-4GlcNAcb"
parse_iupac_compact(iupac_compact)

## -----------------------------------------------------------------------------
glycam <- "DManpa1-3[DManpa1-6]DManpb1-4DGlcpNAcb1-OH"
parse_glycam_iupac(glycam)

## -----------------------------------------------------------------------------
glycoct <- paste0(
  "RES\n",
  "1b:b-dglc-HEX-1:5\n",
  "2b:b-dgal-HEX-1:5\n", 
  "3b:a-dgal-HEX-1:5\n",
  "LIN\n",
  "1:1o(4+1)2d\n",
  "2:2o(3+1)3d"
)
parse_glycoct(glycoct)

## -----------------------------------------------------------------------------
wurcs <- paste0(
  "WURCS=2.0/3,3,2/",
  "[a2122h-1b_1-5][a1122h-1b_1-5][a1122h-1a_1-5]/",
  "1-2-3/a4-b1_b3-c1"
)
parse_wurcs(wurcs)

## -----------------------------------------------------------------------------
kcf <- paste0(
  "ENTRY       G00066                      Glycan\n",
  "NODE        6\n",
  "            1   Cer        18     0\n",
  "            2   Glc        12     0\n",
  "            3   Gal         6     0\n",
  "            4   GlcNAc     -2     0\n",
  "            5   Gal       -10     0\n",
  "            6   GlcNAc    -18     0\n",
  "EDGE        5\n",
  "            1     2:b1    1:1\n",
  "            2     3:b1    2:4\n",
  "            3     4:b1    3:3\n",
  "            4     5:b1    4:4\n",
  "            5     6:b1    5:3\n",
  "///"
)
parse_kcf(kcf)

## -----------------------------------------------------------------------------
linear_code <- "Ma3(Ma6)Mb4GNb4GNb"
parse_linear_code(linear_code)

## -----------------------------------------------------------------------------
linucs <- "[][b-D-Glcp]{[(4+1)][b-D-Galp]{}}"
parse_linucs(linucs)

## -----------------------------------------------------------------------------
gwb <- paste0(
  "freeEnd--1b1D-GlcNAc,p(--6a1L-Fuc,p)",
  "--4b1D-Gal,p--3a2D-NeuAc,p$MONO,Und,0,0,freeEnd"
)
parse_gwb(gwb)

## -----------------------------------------------------------------------------
pglyco <- "(N(F)(N(H(H(N))(H(N(H))))))"
parse_pglyco_struc(pglyco)

## -----------------------------------------------------------------------------
strucgp <- "A2B2C1D1E2F1fedD1E2edcbB5ba"
parse_strucgp_struc(strucgp)

## -----------------------------------------------------------------------------
parse_iupac_compact(
  c(valid = "Galb1-3GalNAca", invalid = "not a glycan"),
  on_failure = "na"
)

