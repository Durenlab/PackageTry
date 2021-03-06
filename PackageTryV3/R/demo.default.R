demo.default <- function(in_foldername,out_foldername,fragment,chr,from,to,width=6,height=4){


  element=read_ATAC_GEX.default(in_foldername)
  W123H=RegNMF.default(E=element$E,
                 O=element$O,
                 Symbol=element$Symbol,
                 PeakName=element$PeakName,
                 Symbol_location=element$Symbol_location,
                 Peak_location=element$Peak_location)



  ans=clustering.default(W123H$H)
  barcord_cluster=SplitGroup.default(foldername=out_foldername,
                     barcord=element$barcode[,1],
                     W3=W123H$W3,
                     H=W123H$H,
                     Reg_symbol_name=W123H$Reg_gene_name,
                     Reg_peak_name=W123H$Reg_peak_name,
                     cluster=ans$S[1,])

  visual_need=callpeak.default(outfolder=out_foldername,
                               fragment=fragment,
                               barcord_cluster_whole=barcord_cluster,
                               macs2path,bedtoolspath)

  clusterlist=unique(ans$S[1,])

  Visualization.default(wholef=in_foldername,
                        peakf=visual_need$peak_clusterF,
                        regf=visual_need$RE_clusterF,
                        chr=chr,
                        from=from,
                        to=to,
                        clusterlist=clusterlist,
                        width=width,height=height)


  return(ans);



}

